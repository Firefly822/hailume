package me.hailu.article;

import lombok.Data;
import me.hailu.mongo.Model;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-9-26
 * Time: 下午4:59
 * To change this template use File | Settings | File Templates.
 */
@Data
public class ArticleImage extends Model {

    public String url;

    public String description;
}
