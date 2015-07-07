package me.hailu.controller;

import me.hailu.article.Article;
import me.hailu.bean.Carousel;
import me.hailu.bean.dao.CarouselDao;
import me.hailu.controller.base.BaseController;
import me.hailu.http.Constants;
import me.hailu.user.User;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wangyapeng on 15/4/16.
 */
@Controller
@RequestMapping(value = "/")
public class EditController extends BaseController{

    CarouselDao dao = new CarouselDao();

    @RequestMapping(value = "/edit/carousel", method = RequestMethod.GET)
    public ModelAndView editSlideView(@RequestParam(value = "id", required = false) Integer id){

        Map<String, Object> params = new HashMap<String, Object>();
        List<Carousel> data = dao.loadCarousels();
        params.put("carousels",data);
        return createMV("slidemanage", params);
    }
}
