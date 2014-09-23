package me.hailu.controller.ajax;

import me.hailu.http.Response;
import me.hailu.user.AccountUtils;
import me.hailu.user.User;
import me.hailu.user.UserDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-9-15
 * Time: 下午2:30
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value = "/ajax/user")
public class UserAjaxController {

    UserDao userDao = new UserDao();

    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Response login(
            @RequestParam(value = "username", required = true) String userName,
            @RequestParam(value = "password", required = true) String password,
            HttpServletResponse response) {

        User user = userDao.loadByUserName(userName);
        if (user == null) {
            return Response.status(500).info("用户名不存在").build();
        } else {
            String encodedPassword = AccountUtils.md5Encode(password);
            if (!user.passWord.equals(encodedPassword)) {
                return Response.status(500).info("密码不正确").build();
            }
            Map result = new HashMap<String, String>();
            result.put("nickname", user.nickName);
            result.put("cookie", user.get_id().toString());
            return Response.status(200).info("登录成功").entity(result).build();
        }
    }

    @ResponseBody
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public Response register(
            @RequestParam(value = "username", required = true) String userName,
            @RequestParam(value = "password", required = true) String password,
            @RequestParam(value = "nickname", required = true) String nickName) {

        //todo
        //very much
        User user = userDao.loadByUserName(userName);
        if (user != null) {
            return Response.status(500).info("用户名已存在").build();
        }
        String encodedPassword = AccountUtils.md5Encode(password);
        user = new User();
        user.userName = userName;
        user.passWord = encodedPassword;
        user.nickName = nickName;
        userDao.save(user);

        Map result = new HashMap<String, String>();
        result.put("nickname", user.nickName);
        result.put("cookie", user.get_id().toString());

        return Response.status(200).info("注册成功").entity(result).build();
    }
}
