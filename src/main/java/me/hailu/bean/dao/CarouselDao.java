package me.hailu.bean.dao;

import com.google.common.collect.Lists;
import me.hailu.bean.Carousel;
import me.hailu.mongo.GenericDAO;

import java.util.List;

/**
 * Created by wangyapeng on 15/4/16.
 */
public class CarouselDao extends GenericDAO<Carousel> {

    public List<Carousel> loadCarousels(){
        return Lists.newArrayList(
                collection.find().sort("{id:-1}").as(Carousel.class)
        );
    }

    public List<Carousel> loadCarousels(int count) {
        return Lists.newArrayList(
                collection.find().sort("{index:1}").limit(count).as(Carousel.class)
        );
    }

    public Carousel findCarousel(int index){
        return collection.findOne("{index:#}", index).as(Carousel.class);
    }

    public void updateOrInsert(Carousel carousel){
        if(carousel.getId()!=-1){
            collection.update("{id:#}", carousel.getId()).merge(carousel);
        }else {
            save(carousel);
        }
    }

    public void updateOrInsertAll(List<Carousel> carousels){
        for(Carousel carousel:carousels){
            updateOrInsert(carousel);
        }
    }

    public void delete(int id){
        collection.remove("{id:#}", id);
    }

}
