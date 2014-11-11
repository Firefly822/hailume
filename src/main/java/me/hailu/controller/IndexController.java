package me.hailu.controller;

import me.hailu.article.Article;
import me.hailu.article.ArticleDao;
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

        List<Article> prologues = new ArrayList<Article>(4);

        List<Article> articles = articleDao.find("");
        for (Article article : articles) {
            if (article.id == 4) {
                prologues.add(0, article);
                articles.remove(article);
            } else if (article.id == 3) {
                prologues.add(1, article);
                articles.remove(article);
            }
        }

        params.put("prologue", prologues);
        params.put("articles", articles);

        return new MVFactory().createMV("index", params);
    }

}
