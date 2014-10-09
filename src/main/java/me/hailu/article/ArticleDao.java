package me.hailu.article;

import me.hailu.mongo.GenericDAO;

/**
 * Created by firefly on 2014/10/9.
 */
public class ArticleDao extends GenericDAO<Article>{

    public Article loadArticleByTitle(String title){
        return collection.findOne("{title:#}", title).as(Article.class);
    }
}
