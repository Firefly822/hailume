package me.hailu.controller.ajax;

import me.hailu.bean.UploadFilesResponse;
import me.hailu.controller.base.Response;
import me.hailu.service.UploadService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-10-11
 * Time: 下午12:00
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value = "/ajax/upload")
public class UploadController {

    @Autowired
    private UploadService uploadService;

    @ResponseBody
    @RequestMapping(value = "/file", method = RequestMethod.POST)
    public Response uploadFile(@RequestParam("file") MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return Response.status(500).info("文件不能为空").build();
        }

        InputStream inputStream = null;
        try {
            inputStream = new ByteArrayInputStream(file.getBytes());
        } catch (IOException e) {
            return Response.status(500).info("文件上传异常").build();
        }
        String url = uploadService.uploadStream(inputStream, "" + new Date().getTime() + file.getOriginalFilename().hashCode());
        if (StringUtils.isEmpty(url)) {
            return Response.status(500).info("文件上传异常").build();
        }
        return Response.status(200).entity(url).build();
    }

    @ResponseBody
    @RequestMapping(value = "/files", method = RequestMethod.POST)
    public UploadFilesResponse uploadFiles(@RequestParam("files[]") List<MultipartFile> files) {
        if (files == null || files.isEmpty()) {
            return new UploadFilesResponse(null);
        }

        Response response = uploadFile(files.get(0));
        if(response.code==200){
            List<UploadFilesResponse.FileResponse> responseList = new ArrayList<UploadFilesResponse.FileResponse>();
            responseList.add(new UploadFilesResponse.FileResponse((String) response.entity));
            return new UploadFilesResponse(responseList);
        }
        return new UploadFilesResponse(null);
    }
}
