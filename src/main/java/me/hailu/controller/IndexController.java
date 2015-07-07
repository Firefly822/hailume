package me.hailu.controller;

import me.hailu.article.Article;
import me.hailu.article.ArticleDao;
import me.hailu.article.ArticleType;
import me.hailu.bean.Carousel;
import me.hailu.bean.dao.CarouselDao;
import me.hailu.controller.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

/**
 * Created by firefly on 2014/9/3.
 */
@Controller
@RequestMapping(value = "/")
public class IndexController extends BaseController {

    ArticleDao articleDao = new ArticleDao();

    CarouselDao carouselDao = new CarouselDao();

    @RequestMapping(value = "/index", method = {RequestMethod.GET, RequestMethod.HEAD} )
    public ModelAndView index() {
        Map<String, Object> params = new HashMap<String, Object>();
        List<Article> articles = articleDao.findByType(ArticleType.DEFAULT, 9);
        List<Article> aboutus = articleDao.findByType(ArticleType.ABOUTUS, 4);
        Collections.sort(aboutus, new Comparator<Article>() {
            @Override
            public int compare(Article o1, Article o2) {
                return o1.id - o2.id;
            }
        });
        List<Carousel> indexs = carouselDao.loadCarousels();
        params.put("indexs", indexs);
        params.put("articles", articles);
        params.put("prologues", aboutus);
        params.put("index", true);

        return createMV("index", params);
    }

}
