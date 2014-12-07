package me.hailu.controller;

import me.hailu.article.Article;
import me.hailu.article.ArticleDao;
import me.hailu.article.ArticleType;
import me.hailu.controller.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by firefly on 2014/9/3.
 */
@Controller
@RequestMapping(value = "/")
public class IndexController extends BaseController {

    ArticleDao articleDao = new ArticleDao();

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("headerText1","KANKAN");
        params.put("content1","有人撸吗？");
        params.put("headerText2","Strong");
        params.put("content2","撸起!");
        params.put("headerText3","Troy");
        params.put("content3","还撸么？");
        params.put("headerText4","Firefly");
        params.put("content4","你们撸吧，我先不撸了。");

//        Map<Integer, Article> prologue = new HashMap<Integer, Article>(4);

        List<Article> articles = articleDao.findByType(ArticleType.DEFAULT, 9);
        List<Article> aboutus = articleDao.findByType(ArticleType.ABOUTUS, 4);

        params.put("articles", articles);
        params.put("prologues", aboutus);

        return new MVFactory().createMV("index", params);
    }

}
