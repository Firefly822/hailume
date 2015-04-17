package me.hailu.service.impl;

import com.qiniu.api.auth.AuthException;
import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.io.IoApi;
import com.qiniu.api.io.PutExtra;
import com.qiniu.api.io.PutRet;
import com.qiniu.api.rs.PutPolicy;
import me.hailu.service.UploadService;
import org.apache.commons.lang.StringUtils;
import org.json.JSONException;
import org.springframework.stereotype.Component;

import java.io.InputStream;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-10-9
 * Time: 下午5:53
 * To change this template use File | Settings | File Templates.
 */
@Component
public class UploadServiceImpl implements UploadService {

    private final String ACCESS_KEY = "IDon'tKnow";
    private final String SECRET_KEY = "YouCanGuess";
    private final String BUCKET_NAME = "hailume";

    @Override
    public String uploadStream(InputStream inputStream, String key) {
        String qiniuKey = null;
        try {
            qiniuKey = upload27niu(inputStream, key);
        } catch (Exception e) {
            return null;
        }

        saveLocalFile(key);

        return generateUrl(qiniuKey);
    }

    private String upload27niu(InputStream inputStream, String key) throws AuthException, JSONException {
        Mac mac = new Mac(ACCESS_KEY, SECRET_KEY);
        PutPolicy putPolicy = new PutPolicy(BUCKET_NAME);
        String uptoken = putPolicy.token(mac);
        PutRet ret = IoApi.Put(uptoken, key, inputStream, new PutExtra());

        return ret.getKey();
    }

    private void saveLocalFile(String key) {

    }

    private String generateUrl(String qiniuKey) {
        if (StringUtils.isEmpty(qiniuKey)) {
            return null;
        }
        return new StringBuilder().append("http://").append(BUCKET_NAME)
                .append(".qiniudn.com/").append(qiniuKey).toString();
    }

}
