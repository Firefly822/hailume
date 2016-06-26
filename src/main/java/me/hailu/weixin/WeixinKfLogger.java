package me.hailu.weixin;

import org.apache.http.client.fluent.Request;
import org.apache.http.entity.ContentType;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Created by liming_liu on 16/6/26.
 */
public class WeixinKfLogger {

    private List<String> alarmUsers = Arrays.asList("o8CwwwFEUQy-TWGXywmS3fptN5gQ");

    public void error(String message, Exception e) {
        for (String openId : alarmUsers) {
            try {
                Request.Post("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=" + AccessTokenServlet.getAccessToken())
                        .bodyString("{\n" +
                                "    \"touser\":\"" + openId + "\",\n" +
                                "    \"msgtype\":\"text\",\n" +
                                "    \"text\":\n" +
                                "    {\n" +
                                "         \"content\":\"" + message + " " + e.getMessage() + "\"\n" +
                                "    }\n" +
                                "}", ContentType.APPLICATION_JSON).execute();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}
