package me.hailu.controller;

import me.hailu.article.Article;
import me.hailu.article.ArticleDao;
import me.hailu.controller.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-10-7
 * Time: 下午7:01
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value = "/")
public class ArticleController extends BaseController {

    ArticleDao articleDao = new ArticleDao();

    @RequestMapping(value = "/publish", method = RequestMethod.GET)
    public ModelAndView publish(){
        Map<String, Object> params = new HashMap<String, Object>();

        return new MVFactory().createMV("publish", params);
    }

    @RequestMapping(value = "/a/{id}", method = RequestMethod.GET)
    public ModelAndView showArticle(@PathVariable Integer id) {
        Map<String, Object> params = new HashMap<String, Object>();

        Article article = articleDao.loadById(id);
        if (article == null) {
            return new MVFactory().createMV("article", null);
        }

        String date = DateFormat.getDateInstance().format(article.addTime);
        params.put("article", article);
        params.put("date", date);

        return new MVFactory().createMV("article", params);
    }
}
