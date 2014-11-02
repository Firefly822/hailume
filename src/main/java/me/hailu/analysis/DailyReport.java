package me.hailu.analysis;

import lombok.Data;
import me.hailu.mongo.Model;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14/10/31
 * Time: 下午1:38
 * To change this template use File | Settings | File Templates.
 */
@Data
public class DailyReport extends Model {

    //日期
    public String dateTitle;
    //浏览器打开页面次数
    public int pv;
    //url访问情况
    public Map<String, Integer> access;
}
