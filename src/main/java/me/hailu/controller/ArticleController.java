package me.hailu.controller;

import me.hailu.article.Article;
import me.hailu.article.ArticleDao;
import me.hailu.http.Constants;
import me.hailu.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
public class ArticleController {

    @Autowired
    private javax.servlet.http.HttpServletRequest request;

    ArticleDao articleDao = new ArticleDao();

    @RequestMapping(value = "/publish", method = RequestMethod.GET)
    public ModelAndView publish(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("publish");
        return modelAndView;
    }

    @RequestMapping(value = "/a/${id}", method = RequestMethod.GET)
    public ModelAndView showArticle(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        Map<String, Object> params = new HashMap<String, Object>();

        User user = (User) request.getAttribute(Constants.USER_INFO);
        if (user != null) {
            params.put("user", user);
        }

        Article article = articleDao.loadById(id);
        if (article == null) {
            modelAndView.setViewName("article");
            return modelAndView;
        }
        params.put("article", article);

        modelAndView.setViewName("article");
        return modelAndView;
    }
}
