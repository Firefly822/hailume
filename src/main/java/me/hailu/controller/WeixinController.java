package me.hailu.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Data;
import me.hailu.controller.base.BaseController;
import me.hailu.weixin.AccessTokenServlet;
import me.hailu.weixin.CheckUtil;
import me.hailu.weixin.SignUtil;
import me.hailu.weixin.WeixinKfLogger;
import org.apache.commons.io.IOUtils;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Response;
import org.apache.http.entity.ContentType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by liming_liu on 16/6/18.
 */
@Controller
@RequestMapping(value = "/")
public class WeixinController extends BaseController {

    private WeixinKfLogger logger = new WeixinKfLogger();

    @ResponseBody
    @RequestMapping(value = "/weixin")
    public String serveWeixin(HttpServletRequest request, HttpServletResponse response) {
        try {
            StringWriter writer = new StringWriter();
            IOUtils.copy(request.getInputStream(), writer);
            System.out.println("/weixin request receive: " + writer.toString());
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

        // 接收微信服务器以Get请求发送的4个参数
        String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");
        String echostr = request.getParameter("echostr");

        if (CheckUtil.checkSignature(signature, timestamp, nonce)) {
            return echostr;
        }
        return null;
    }

    @RequestMapping(value = "/weixin/jssign", method = RequestMethod.GET)
    public ModelAndView showWeixinPage(HttpServletRequest request) {
        String url = request.getRequestURL().toString();
        Map<String, Object> ret = SignUtil.sign(AccessTokenServlet.getAccessToken(), url);
        ret.put("appId", AccessTokenServlet.appId);
        ret.put("doMain", "hailu.me");
        return createMV("weixin", ret);
    }

    @RequestMapping(value = "/weixin/qrcode", method = RequestMethod.GET)
    public ModelAndView showQrcode(@RequestParam(value = "str")String str) {
        String body = "{\"action_name\": \"QR_LIMIT_STR_SCENE\", \"action_info\": {\"scene\": {\"scene_str\": \"" + str + "\"}}}";
        try {
            Response response = Request.Post("https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=" + AccessTokenServlet.getAccessToken())
                    .bodyString(body, ContentType.APPLICATION_JSON).execute();
            QrcodeResponse qrcodeResponse = new ObjectMapper().readValue(response.returnContent().asBytes(), QrcodeResponse.class);
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("url", qrcodeResponse.url);
            params.put("ticket", qrcodeResponse.ticket);
            return createMV("weixin/qrcode", params);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Data
    private static class QrcodeResponse {
        private String ticket;
        private int expire_seconds;
        private String url;
    }

    @ResponseBody
    @RequestMapping(value = "/weixin/userinfo", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String showUserInfo(@RequestParam(value = "openid")String openId) {
        try {
            Response response = Request.Get("https://api.weixin.qq.com/cgi-bin/user/info?access_token=" + AccessTokenServlet.getAccessToken() +
                    "&openid=" + openId + "&lang=zh_CN").execute();
            String result = new String(response.returnContent().asBytes(), "UTF-8");
            return result;
        } catch (IOException e) {
            logger.error("userinfo error", e);
            return null;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/weixin/setButton", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String setButton() {
        try {
            Response response = Request.Post("https://api.weixin.qq.com/cgi-bin/menu/create?access_token=" + AccessTokenServlet.getAccessToken())
                    .bodyString("{\n" +
                            "     \"button\":[\n" +
                            "     {\t\n" +
                            "          \"type\":\"view\",\n" +
                            "          \"name\":\"首页\",\n" +
                            "          \"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + AccessTokenServlet.appId + "&redirect_uri=http%3a%2f%2fhailu.me%2fweixin%2flogin&response_type=code&scope=snsapi_base&state=123#wechat_redirect\"\n" +
                            "      }]\n" +
                            " }", ContentType.APPLICATION_JSON).execute();
            String result = new String(response.returnContent().asBytes(), "UTF-8");
            return result;
        } catch (IOException e) {
            logger.error("userinfo error", e);
            return null;
        }
    }

    @RequestMapping(value = "/weixin/login", method = RequestMethod.GET)
    public ModelAndView showLoginPage(@RequestParam(value = "code")String code) {
        try {
            Response response = Request.Get("https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + AccessTokenServlet.appId +
                    "&secret=" + AccessTokenServlet.appsecret + "&code=" + code + "&grant_type=authorization_code")
                    .execute();
            AccessTokenResponse accessTokenResponse = new ObjectMapper().readValue(response.returnContent().asBytes(), AccessTokenResponse.class);
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("openid", accessTokenResponse.openid);
            params.put("scope", accessTokenResponse.scope);
            params.put("access_token", accessTokenResponse.access_token);

            String userInfoStr = showUserInfo(accessTokenResponse.openid);
            System.out.println(userInfoStr);
            UserInfo userInfo = new ObjectMapper().readValue(userInfoStr, UserInfo.class);
            params.put("userInfo", userInfo);
            return createMV("weixin/login", params);
        } catch (IOException e) {
            logger.error("/weixin/login", e);
            return null;
        }
    }

    @Data
    private static class UserInfo {
        private String nickname;
        private String headimgurl;
    }

    @Data
    private static class AccessTokenResponse {
        private String access_token;
        private int expires_in;
        private String refresh_token;
        private String openid;
        private String scope;
    }
}
