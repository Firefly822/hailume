package me.hailu.mongo;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.apache.commons.lang.StringUtils;
import org.bson.types.ObjectId;
import org.jongo.MongoCollection;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-9-12
 * Time: 上午12:00
 * To change this template use File | Settings | File Templates.
 */
public abstract class GenericDAO<T extends Model> {
    protected final MongoCollection collection;
    protected final MongoCollection globalCollection;
    protected final String collectionName;
    protected final Class<T> clazz;

    public GenericDAO() {
        clazz = getType();
        collectionName = StringUtils.lowerCase(clazz.getSimpleName());
        collection = JongoClient.getInstance().getCollection(collectionName);
        globalCollection = JongoClient.getInstance().getCollection("global");
        GlobalModel model = globalCollection.findOne("{name:#}", collectionName).as(GlobalModel.class);
        if (model == null) {
            model = new GlobalModel();
            model.name = collectionName;
            model.nextId = 0;
            globalCollection.save(model);
        }
    }

    private Class<T> getType(){
        ParameterizedType type = (ParameterizedType)this.getClass().getGenericSuperclass();
        return (Class) type.getActualTypeArguments()[0];
    }

    public T loadById(String id) {
        ObjectId _id = null;
        try {
            new ObjectId(id);
        } catch (Exception e) {
            return null;
        }
        return collection.findOne(new ObjectId(id)).as(clazz);
    }

    public Iterable<T> find(String query, Object... params) {
        return collection.find(query, params).as(clazz);
    }

    /**
     * save object, will auto generate id, addTime and updateTime
     * @param t
     * @return
     */
    public T save(T t) {
        GlobalModel model = globalCollection.findAndModify(
                "{update:{$inc:{nextId':1}}, query:{name:#}",collectionName).as(GlobalModel.class);
        t.id = model.nextId;
        Date now = new Date();
        t.addTime = now;
        t.updateTime = now;
        collection.save(t);
        return t;
    }

    /**
     * update object, will change updateTime
     * @param t
     * @return
     */
    public T update(T t) {
        t.updateTime = new Date();
        collection.update(t._id).merge(t);
        return t;
    }

    public void deleteById(String id) {
        collection.remove(new ObjectId(id));
    }

    /**
     * 清空collection，慎用
     */
    @Deprecated
    public void clear() {
        collection.remove();
    }

    public MongoCollection getCollection(){
        return collection;
    }

    private class GlobalModel implements Serializable {

        private static final long serialVersionUID = 1L;

        @JsonProperty("_id")
        public ObjectId _id;
        public String name;
        public int nextId;
    }
}
