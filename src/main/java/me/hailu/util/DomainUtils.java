package me.hailu.util;

import org.apache.commons.lang.StringUtils;

/**
 * Created by liming_liu on 15/8/4.
 */
public abstract class DomainUtils {

    public static void replaceDomain(String url) {
        if (StringUtils.isNotBlank(url)) {
            url = url.replaceFirst("http://hailume.qiniudn.com", "http://7oxg65.com1.z0.glb.clouddn.com");
        }
    }
}
