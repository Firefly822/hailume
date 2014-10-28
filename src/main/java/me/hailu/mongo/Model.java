package me.hailu.mongo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.bson.types.ObjectId;

import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-9-13
 * Time: 下午12:12
 * To change this template use File | Settings | File Templates.
 */
@Data
public class Model implements Serializable {

    private static final long serialVersionUID = 1L;

    @JsonProperty("_id")
    protected ObjectId _id;
    public int id;
    public Date addTime;
    public Date updateTime;


    @XmlJavaTypeAdapter(ObjectIdAdaptor.class)
    public ObjectId get_id() {
        return _id;
    }

    /**
     * 手动设置objectId，慎用
     * @param _id
     */
    @Deprecated
    public void set_id(ObjectId _id) {
        this._id = _id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Model)) return false;

        Model model = (Model) o;

        if (!_id.equals(model._id)) return false;

        return true;
    }

    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    @Override
    public int hashCode() {
        return _id.hashCode();
    }
}
