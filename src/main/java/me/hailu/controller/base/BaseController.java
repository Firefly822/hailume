package me.hailu.controller.base;

import me.hailu.analysis.DailyReportDao;
import me.hailu.http.Constants;
import me.hailu.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14/10/31
 * Time: 下午2:42
 * To change this template use File | Settings | File Templates.
 */
@Controller
public abstract class BaseController {

    @Autowired
    protected javax.servlet.http.HttpServletRequest request;

    DailyReportDao dailyReportDao = new DailyReportDao();

    protected User getUser() {
        return (User) request.getAttribute(Constants.USER_INFO);
    }

    protected ModelAndView createMV(String view) {
        return createMV(view, null);
    }

    protected ModelAndView createMV(String view, Map<String, Object> params) {
        if (params == null) {
            params = new HashMap<String, Object>();
        }
        User user = getUser();
        if (user != null) {
            params.put("userNickName", user.nickName);
        }
        logAccess(view);
        return new ModelAndView(view, params);
    }

    protected void logAccess(String req) {
        dailyReportDao.incAccess(new Date(), req);
    }

    protected boolean fromMobile() {
        String userAgent = request.getHeader("User-Agent").toLowerCase();
        if (userAgent.contains("mobile") || userAgent.contains("iphone")
                || userAgent.contains("android")) {
            return true;
        }
        return false;
    }
}
