package me.hailu.controller;

import me.hailu.weixin.CheckUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by liming_liu on 16/6/18.
 */
@Controller
@RequestMapping(value = "/")
public class WeixinController {

    private static final String APP_ID = "wxd1609c7bf1125e78";
    private static final String APP_SECRET = "550ceaaaaa04e387e0c84f35620020e0";

    @ResponseBody
    @RequestMapping(value = "/weixin")
    public String serveWeixin(HttpServletRequest request, HttpServletResponse response) {
        try {
            System.out.println("/weixin request receive: " + request.getInputStream().toString());
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
}
