package me.hailu.user;

import me.hailu.mongo.GenericDAO;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-9-16
 * Time: 上午9:35
 * To change this template use File | Settings | File Templates.
 */
public abstract class AccountUtils {

    public static String generateRandomString(int length) {
        StringBuffer buffer = new StringBuffer("0123456789abcdefghijklmnopqrstuvwxyz");
        StringBuffer sb = new StringBuffer();
        Random r = new Random();
        int range = buffer.length();
        for (int i = 0; i < length; i ++) {
            sb.append(buffer.charAt(r.nextInt(range)));
        }
        return sb.toString();
    }

    public static String md5Encode(String password) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        md.update(password.getBytes());
        byte[] bs=md.digest();
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<bs.length;i++){    //字节数组转换成十六进制字符串，形成最终的密文
            int v=bs[i]&0xff;
            if(v<16){
                sb.append(0);
            }else{
                sb.append(Integer.toHexString(v));
            }
        }
        GenericDAO.GlobalModel model = new GenericDAO.GlobalModel();
        return sb.toString();
    }
}
