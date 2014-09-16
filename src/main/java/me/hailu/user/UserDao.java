package me.hailu.user;

import com.google.common.collect.Lists;
import me.hailu.mongo.GenericDAO;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-9-15
 * Time: 下午2:11
 * To change this template use File | Settings | File Templates.
 */
public class UserDao extends GenericDAO<User> {

    public User loadByUserName(String userName) {
        return collection.findOne("{userName:#}", userName).as(User.class);
    }

    public List<User> findNickName(String nickName) {
        return Lists.newArrayList(
                collection.find("{userName:#}", nickName).as(User.class)
        );
    }
}
