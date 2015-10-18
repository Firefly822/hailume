package me.hailu.http;

import org.springframework.core.Ordered;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by liming_liu on 15/10/18.
 */
public class LoggingMappingExceptionResolver implements HandlerExceptionResolver, Ordered {

    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        ex.printStackTrace();
        return null;
    }

    public int getOrder() {
        return Integer.MIN_VALUE;
    }
}
