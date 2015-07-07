package me.hailu.controller.base;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 15/2/1
 * Time: 下午3:40
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class ErrorController extends BaseController {

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public ModelAndView returnError() {
        return createMV("error");
    }
}
