package me.hailu.bean;

import lombok.Data;
import me.hailu.mongo.Model;

/**
 * Created by wangyapeng on 15/4/16.
 */
@Data
public class Carousel extends Model{

    /**
     * 轮播图位置
     */
    public int index;
    /**
     * 标题
     */
    public String title;
    /**
     * 摘要
     */
    public String brief;
    /**
     * 链接
     */
    public String link;
    /**
     * 背景图
     */
    public String image;
}
