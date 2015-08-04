package me.hailu.controller.ajax;

import me.hailu.article.Article;
import me.hailu.article.ArticleDao;
import me.hailu.controller.base.Response;
import me.hailu.http.Constants;
import me.hailu.user.User;
import me.hailu.util.DomainUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by firefly on 2014/10/9.
 */
@Controller
@RequestMapping(value = "/ajax/article")
public class ArticleAjaxController {

    @Autowired
    private javax.servlet.http.HttpServletRequest request;

    ArticleDao articleDao = new ArticleDao();

    @ResponseBody
    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    public Response publish(@RequestBody Article article) {

        User user = (User) request.getAttribute(Constants.USER_INFO);
        if (user == null) {
            return Response.status(403).info("发表文章需先登录").build();

        } else if (article.id > 0) {
            Article originArticle = articleDao.loadById(article.id);
            if (originArticle.authorId != user.id) {
                return Response.status(403).info("不能编辑其他人的文章").build();
            }
            originArticle.title = article.title;
            originArticle.brief = article.brief;
            DomainUtils.replaceDomain(article.image.url);
            originArticle.image = article.image;
            originArticle.tags = article.tags;
            originArticle.content = article.content;

            articleDao.update(originArticle);

            return Response.status(200).info("编辑成功").build();

        } else {
            article.authorId = user.id;
            article.authorName = user.nickName;

            articleDao.save(article);

            return Response.status(200).info("发表成功").build();
        }
    }

    @RequestMapping(value = "/preview", method = RequestMethod.POST)
    public ModelAndView preview(@RequestBody Article article) {
        ModelAndView model = new ModelAndView();
        Map<String, Object> params = new HashMap<String, Object>();

        String date = DateFormat.getDateInstance().format(new Date());
        params.put("article", article);
        params.put("date", date);

        model.setViewName("article");
        model.addAllObjects(params);

        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/loadpage", method = RequestMethod.POST)
    public Response loadPage(
            @RequestParam(value = "title", required = true) String title,
            HttpServletResponse response){
        Article article = articleDao.loadArticleByTitle(title);
        if(article==null){
            return Response.status(400).info("文章不存在").build();
        }
        Map<String,String> result = new HashMap<String,String>();
        result.put("title",article.title);
        result.put("content",article.content);
        return Response.status(200).info("加载成功").entity(result).build();
    }
}
