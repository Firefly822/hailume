package me.hailu.analysis;

import me.hailu.mongo.GenericDAO;

import java.text.DateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14/10/31
 * Time: 下午1:42
 * To change this template use File | Settings | File Templates.
 */
public class DailyReportDao extends GenericDAO<DailyReport> {

    public DailyReport loadByDate(Date date) {
        String title = DateFormat.getDateInstance().format(date);
        return collection.findOne("{dateTitle:#}", title).as(clazz);
    }

    public void incPv(Date date) {
        String title = DateFormat.getDateInstance().format(date);
        collection.update("{dateTitle:#}", title).upsert().with("{$inc:{pv:1}}");
    }

    public void incAccess(Date date, String view) {
        String title = DateFormat.getDateInstance().format(date);
        collection.update("{dateTitle:#}", title).upsert().with("{$inc:{access.#:1}}", view);
    }
}
