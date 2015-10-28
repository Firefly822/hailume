package me.hailu.bean;

import java.util.List;

/**
 * Created by wangyapeng on 15/10/28.
 */
public class UploadFilesResponse {
    public List<FileResponse> files;

    public UploadFilesResponse(List<FileResponse> list){
        this.files = list;
    }

    public static class FileResponse{
        public String url;

        public FileResponse(String url){
            this.url = url;
        }
    }
}
