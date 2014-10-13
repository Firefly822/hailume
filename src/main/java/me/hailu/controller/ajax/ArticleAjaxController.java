package me.hailu.controller.ajax;

import me.hailu.article.Article;
import me.hailu.article.ArticleDao;
import me.hailu.http.Response;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by firefly on 2014/10/9.
 */
@Controller
@RequestMapping(value = "/ajax/article")
public class ArticleAjaxController {

    ArticleDao dao = new ArticleDao();

    @ResponseBody
    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    public Response publish(
            @RequestParam(value = "title", required = true) String title,
            @RequestParam(value = "content", required = true) String content,
            HttpServletResponse response){
        Article article = new Article();
        article.title = title;
        article.content = content;
        dao.save(article);
        return Response.status(200).info("发表成功").build();
    }

    @ResponseBody
    @RequestMapping(value = "/loadpage", method = RequestMethod.POST)
    public Response loadPage(
            @RequestParam(value = "title", required = true) String title,
            HttpServletResponse response){
        Article article = dao.loadArticleByTitle(title);
        if(article==null){
            return Response.status(400).info("文章不存在").build();
        }
        Map<String,String> result = new HashMap<String,String>();
        result.put("title",article.title);
        result.put("content",article.content);
        return Response.status(200).info("加载成功").entity(result).build();
    }
}
