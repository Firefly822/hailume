package me.hailu.http;

import me.hailu.analysis.DailyReportDao;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 15/5/5
 * Time: 下午3:55
 * To change this template use File | Settings | File Templates.
 */
public class OutFilter implements Filter {

    private DailyReportDao dailyReportDao = new DailyReportDao();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        dailyReportDao.incAccess(new Date(), ((HttpServletRequest) servletRequest).getRequestURI());

        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        //To change body of implemented methods use File | Settings | File Templates.
    }
}
