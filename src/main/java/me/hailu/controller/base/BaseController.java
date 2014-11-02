package me.hailu.controller.base;

import me.hailu.analysis.DailyReportDao;
import me.hailu.http.Constants;
import me.hailu.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
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

    protected User getUser() {
        return (User) request.getAttribute(Constants.USER_INFO);
    }

    public class MVFactory {

        DailyReportDao dailyReportDao = new DailyReportDao();

        public ModelAndView createMV(String view, Map<String, Object> params) {
            User user = getUser();
            if (user != null) {
                params.put("userNickName", user.nickName);
            }
            dailyReportDao.incAccess(new Date(), view);
            return new ModelAndView(view, params);
        }
    }
}
