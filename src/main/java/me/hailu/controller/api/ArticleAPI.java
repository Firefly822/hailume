package me.hailu.controller.api;

import me.hailu.article.Article;
import me.hailu.article.ArticleDao;
import me.hailu.article.ArticleType;
import me.hailu.bean.dao.CarouselDao;
import me.hailu.controller.base.BaseController;
import me.hailu.controller.base.Response;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liming_liu on 15/10/18.
 */
@Controller
@RequestMapping(value = "/api/article")
public class ArticleAPI extends BaseController {

    private ArticleDao articleDao = new ArticleDao();
    private CarouselDao carouselDao = new CarouselDao();

    private DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Response loadArticle(@PathVariable Integer id) {
        Article article = articleDao.loadById(id);
        if (article == null) {
            return Response.status(404).info("没有数据").build();
        }
        return Response.status(200).info("获取成功").entity(transferToVO(article)).build();
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Response findArticles(@RequestParam(value = "size", required = true) int count,
                                 @RequestParam(value = "page", required = true) int page) {
        List<Article> articles = articleDao.paginateByType(ArticleType.DEFAULT, count, page);
        List<ArticleVO> articleVOs = transferToVOs(articles);
        if (CollectionUtils.isEmpty(articleVOs)) {
            return Response.status(404).info("没有数据").build();
        }
        return Response.status(200).info("获取成功").entity(articleVOs).build();
    }

    private List<ArticleVO> transferToVOs(List<Article> articles) {
        List<ArticleVO> articleVOs = new ArrayList<ArticleVO>();
        if (CollectionUtils.isEmpty(articles)) {
            return articleVOs;
        }
        for (Article article : articles) {
            ArticleVO articleVO = transferToVO(article);
            articleVOs.add(articleVO);
        }
        return articleVOs;
    }

    private ArticleVO transferToVO(Article article) {
        ArticleVO articleVO = new ArticleVO();
        articleVO.id = article.id;
        articleVO.title = article.title;
        articleVO.time = dateFormat.format(article.addTime);
        articleVO.brief = article.brief;
        articleVO.image = article.image == null ? null : article.image.url;
        articleVO.content = article.content;

        return articleVO;
    }

    public static class ArticleVO {
        public int id;
        public String time;
        public String title;
        public String brief;
        public String image;
        public String content;
    }
}
