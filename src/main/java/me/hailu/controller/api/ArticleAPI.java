package me.hailu.controller.api;

import me.hailu.article.Article;
import me.hailu.article.ArticleDao;
import me.hailu.article.ArticleType;
import me.hailu.bean.Carousel;
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
        articleVO.url = "http://hailu.me/a/" + article.id;
        articleVO.title = article.title;
        articleVO.time = dateFormat.format(article.addTime);
        articleVO.brief = article.brief;
        articleVO.image = article.image == null ? null : article.image.url;

        return articleVO;
    }
    @RequestMapping(value = "/carousel", method = RequestMethod.GET)
    @ResponseBody
    public Response findCarousels(@RequestParam(value = "size", required = false) int count) {
        if (count == 0) {
            count = 5;
        }
        List<Carousel> carousels = carouselDao.loadCarousels(count);
        if (CollectionUtils.isEmpty(carousels)) {
            return Response.status(404).info("没有数据").build();
        }
        List<ArticleVO> articleVOs = new ArrayList<ArticleVO>();
        for (Carousel carousel : carousels) {
            ArticleVO articleVO = transferToVO(carousel);
            articleVOs.add(articleVO);
        }
        return Response.status(200).info("获取成功").entity(articleVOs).build();
    }

    private ArticleVO transferToVO(Carousel carousel) {
        ArticleVO articleVO = new ArticleVO();
        if (carousel.link.startsWith("http")) {
            articleVO.url = carousel.link;
        } else {
            articleVO.url = "http://hailu.me" + carousel.link;
        }
        articleVO.image = carousel.image;
        articleVO.title = carousel.title;
        articleVO.brief = carousel.brief;

        return articleVO;
    }

    public static class ArticleVO {
        public String url;
        public String time;
        public String title;
        public String brief;
        public String image;
    }
}
