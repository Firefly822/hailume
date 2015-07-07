package me.hailu.article;

import com.google.common.collect.Lists;
import me.hailu.mongo.GenericDAO;

import java.util.List;

/**
 * Created by firefly on 2014/10/9.
 */
public class ArticleDao extends GenericDAO<Article>{

    public Article loadArticleByTitle(String title) {
        return collection.findOne("{title:#}", title).as(Article.class);
    }

    public List<Article> findByType(ArticleType type, int count) {
        return Lists.newArrayList(
                collection.find("{type:#}", type.toString()).limit(count).sort("{id:-1}").as(Article.class)
        );
    }

    public List<Article> findNewArticleList(int count){
        return Lists.newArrayList(
                collection.find().limit(count).as(Article.class)
        );
    }

}
