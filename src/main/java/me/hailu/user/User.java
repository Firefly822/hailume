package me.hailu.user;

import me.hailu.mongo.Model;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-9-14
 * Time: 下午8:42
 * To change this template use File | Settings | File Templates.
 */
public class User extends Model {

    //昵称
    public String nickName;
    //登录名
    public String userName;
    //密码（加密）
    public String passWord;
}
