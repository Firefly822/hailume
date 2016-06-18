package me.hailu.weixin;

import org.apache.commons.codec.digest.DigestUtils;

import java.util.Arrays;

/**
 * Created by liming_liu on 16/6/18.
 */
public class CheckUtil {
    private static final String token = "weixin";
    public static boolean checkSignature(String signature,String timestamp,String nonce){

        try {
            String[] arr = new String[] { token, timestamp, nonce };

            // 排序
            Arrays.sort(arr);
            // 生成字符串
            StringBuilder content = new StringBuilder();
            for (int i = 0; i < arr.length; i++) {
                content.append(arr[i]);
            }

            // sha1加密
            String temp = DigestUtils.shaHex(content.toString());

            return temp.equals(signature); // 与微信传递过来的签名进行比较
        } catch (Exception e) {
            return false;
        }
    }
}
