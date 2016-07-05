package me.hailu.weixin;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Data;
import org.apache.commons.lang.StringUtils;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Response;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.io.IOException;

/**
 * Created by liming_liu on 16/6/22.
 */
public class AccessTokenServlet extends HttpServlet implements Runnable {

    public static final String appId = "wxd1609c7bf1125e78";
    public static final String appsecret = "550ceaaaaa04e387e0c84f35620020e0";

    private static String accessToken = null;
    private static String jsapiTicket = null;

    public static String getAccessToken() {
        return accessToken;
    }

    @Override
    public void init() throws ServletException {
        Thread t = new Thread(this);
        t.start();
    }

    public void run() {
        while (true) {
            try {
                int sleepTime = 7000 * 1000;
                Response response = Request.Get("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + appId + "&secret=" + appsecret).execute();
                AccessTokenResponse accessTokenResponse = new ObjectMapper().readValue(response.returnContent().asBytes(), AccessTokenResponse.class);
                if (accessTokenResponse != null && StringUtils.isNotBlank(accessTokenResponse.access_token)) {
                    accessToken = accessTokenResponse.access_token;
                    if (accessTokenResponse.expires_in > 0) {
                        sleepTime = accessTokenResponse.expires_in * 800;
                    }
                    System.out.println("Fresh access token: " + accessToken);
                }
                if (StringUtils.isNotBlank(accessToken)) {
                    Response response1 = Request.Get("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + accessToken + "&type=jsapi").execute();
                    JsapiResponse jsapiResponse = new ObjectMapper().readValue(response1.returnContent().asBytes(), JsapiResponse.class);
                    if (jsapiResponse != null && StringUtils.isNotBlank(jsapiResponse.ticket)) {
                        jsapiTicket = jsapiResponse.ticket;
                        if (jsapiResponse.expires_in > 0 && sleepTime > jsapiResponse.expires_in * 800) {
                            sleepTime = jsapiResponse.expires_in * 800;
                        }
                    }
                }
                Thread.sleep(sleepTime);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
                System.out.println("Access Token Thread Stoped.");
                return;
            }
        }
    }

    @Data
    private static class AccessTokenResponse {
        private String access_token;
        private int expires_in;
    }

    @Data
    private static class JsapiResponse {
        private int errcode;
        private String errmsg;
        private String ticket;
        private int expires_in;
    }
}
