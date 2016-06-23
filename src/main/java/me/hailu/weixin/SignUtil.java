package me.hailu.weixin;

import org.apache.commons.codec.digest.DigestUtils;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by liming_liu on 16/6/23.
 */
public abstract class SignUtil {

    public static Map<String, Object> sign(String jsapi_ticket, String url) {
        Map<String, Object> ret = new HashMap<String, Object>();
        String nonce_str = create_nonce_str();
        String timestamp = create_timestamp();
        String string1;
        String signature = "";
        string1 = "jsapi_ticket=" + jsapi_ticket + "&noncestr=" + nonce_str+ "×tamp=" + timestamp + "&url=" + url;
        signature = DigestUtils.shaHex(string1);
//        try {
//            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
//            crypt.reset();
//            crypt.update(string1.getBytes("UTF-8"));
//            signature = byteToHex(crypt.digest());
//        } catch (NoSuchAlgorithmException e) {
//            e.printStackTrace();
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        ret.put("url", url);
        ret.put("jsapi_ticket", jsapi_ticket);
        ret.put("nonceStr", nonce_str);
        ret.put("timestamp", timestamp);
        ret.put("signature", signature);
        return ret;
    }

    private static String create_nonce_str() {
        return UUID.randomUUID().toString();
    }

    private static String create_timestamp() {
        return Long.toString(System.currentTimeMillis() / 1000);
    }
}
