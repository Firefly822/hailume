package me.hailu.controller;

import me.hailu.article.Article;
import me.hailu.article.ArticleDao;
import me.hailu.bean.Carousel;
import me.hailu.bean.dao.CarouselDao;
import me.hailu.controller.base.BaseController;
import me.hailu.controller.base.Response;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by wangyapeng on 15/3/4.
 */
//@Controller
@RequestMapping(value = "/")
public class ApiController extends BaseController{

    ArticleDao articleDao = new ArticleDao();
    CarouselDao carouselDao = new CarouselDao();

    @RequestMapping(value = "/api/article/list", method = RequestMethod.GET)
    @ResponseBody
    public Response getNewArticleList(){
        List<Article> list = articleDao.findNewArticleList(10);
        if(list==null){
            return Response.status(400).info("获取错误").build();
        }
        return Response.status(200).info("获取成功").entity(list).build();
    }
    @RequestMapping(value = "/api/carousels", method = RequestMethod.GET)
    @ResponseBody
    public Response getCarousels(){
        List<Carousel> list = carouselDao.loadCarousels();
        if(list==null){
            return Response.status(400).info("获取错误").build();
        }
        return Response.status(200).info("获取成功").entity(list).build();
    }

    @RequestMapping(value = "/api/article/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Response showArticle(@PathVariable Integer id) {
        Article article = articleDao.loadById(id);
        if (article == null) {
            return Response.status(404).info("没有数据").build();
        }
        return Response.status(200).info("获取成功").entity(article).build();
    }
}
