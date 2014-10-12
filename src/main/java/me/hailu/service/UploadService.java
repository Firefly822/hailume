package me.hailu.service;

import java.io.InputStream;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-9-29
 * Time: 下午5:10
 * To change this template use File | Settings | File Templates.
 */
public interface UploadService {

    String uploadStream(InputStream inputStream, String key);
}
