package me.hailu.article;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14/12/6
 * Time: 下午5:34
 * To change this template use File | Settings | File Templates.
 */
public enum ArticleType {

    DEFAULT(null),
    ABOUTUS("aboutus"),
    ;

    private String type;

    private ArticleType(String type) {
        this.type = type;
    }

    public String toString() {
        return type;
    }

}
