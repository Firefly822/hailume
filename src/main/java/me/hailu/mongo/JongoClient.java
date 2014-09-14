package me.hailu.mongo;

import org.jongo.Jongo;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-9-11
 * Time: 下午11:55
 * To change this template use File | Settings | File Templates.
 */
public class JongoClient {

    private static Jongo jongo = new Jongo(MongoFactory.getMongo().getDB("hailume"));

    public static Jongo getInstance() {
        return jongo;
    }
}
