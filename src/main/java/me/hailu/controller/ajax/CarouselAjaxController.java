package me.hailu.controller.ajax;

import me.hailu.bean.Carousel;
import me.hailu.bean.dao.CarouselDao;
import me.hailu.controller.base.Response;
import me.hailu.http.Constants;
import me.hailu.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by wangyapeng on 15/4/16.
 */
@Controller
@RequestMapping(value = "/ajax/carousel")
public class CarouselAjaxController {
    @Autowired
    private javax.servlet.http.HttpServletRequest request;

    CarouselDao dao = new CarouselDao();

    @ResponseBody
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public Response insert(@RequestBody List<Carousel> data){
        User user = (User) request.getAttribute(Constants.USER_INFO);
        if(user==null){
            return Response.status(400).info("请登录").build();
        }
        dao.updateOrInsertAll(data);
        return Response.status(200).info("修改成功").build();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public Response delete(@RequestBody Carousel carousel){
        User user = (User) request.getAttribute(Constants.USER_INFO);
        if(user==null){
            return Response.status(400).info("请登录").build();
        }
        dao.delete(carousel.getId());
        return Response.status(200).info("删除成功").build();
    }


}
