package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by firefly on 2014/9/3.
 */
@Controller
public class WebController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        return "index";
    }

    @RequestMapping(value = "/newpage", method = RequestMethod.GET)
    public String helloworld(Model model) {
        model.addAttribute("newvalue", "http://image.qtv.com.cn/0/11/53/57/11535780_842371.jpg");
        return "newpage";
    }
}
