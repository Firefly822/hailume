package me.hailu.controller;

import me.hailu.article.Article;
import me.hailu.article.ArticleDao;
import me.hailu.http.Constants;
import me.hailu.user.User;
import org.springframework.beans.factory.annotation.Autowired;
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
public class IndexController {

    ArticleDao articleDao = new ArticleDao();

    @Autowired
    private javax.servlet.http.HttpServletRequest request;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView model = new ModelAndView();
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("headerText1","KANKAN");
        params.put("content1","有人撸吗？");
        params.put("headerText2","Strong");
        params.put("content2","撸起!");
        params.put("headerText3","Troy");
        params.put("content3","还撸么？");
        params.put("headerText4","Firefly");
        params.put("content4","你们撸吧，我先不撸了。");

        User user = (User) request.getAttribute(Constants.USER_INFO);
        if (user != null) {
            params.put("userNickName", user.nickName);
        }

        List<Article> articles = articleDao.find("");
        params.put("articles", articles);

        model.addAllObjects(params);
        model.setViewName("index");
        return model;
    }

}
