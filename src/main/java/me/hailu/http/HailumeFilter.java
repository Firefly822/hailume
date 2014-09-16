package me.hailu.http;

import me.hailu.user.User;
import me.hailu.user.UserDao;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-9-15
 * Time: 下午7:37
 * To change this template use File | Settings | File Templates.
 */
public class HailumeFilter implements Filter {

    private UserDao userDao = new UserDao();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        setUserInfo(servletRequest);

        filterChain.doFilter(servletRequest, servletResponse);
    }

    private void setUserInfo(ServletRequest servletRequest) {
        String sessionStr = null;
        Cookie[] cookies = ((HttpServletRequest) servletRequest).getCookies();
        if (cookies == null) {
            return;
        }
        for (Cookie cookie : cookies) {
            if (cookie == null) continue;
            if (Constants.SESSION_NAME.equals(cookie.getName())) {
                sessionStr = cookie.getValue();
                break;
            }
        }
        User user = userDao.loadByObjectId(sessionStr);
        if (user != null) {
            servletRequest.setAttribute(Constants.USER_INFO, user);
        }
    }

    @Override
    public void destroy() {
        //To change body of implemented methods use File | Settings | File Templates.
    }
}
