package cn.wmyskxz.service;

import cn.wmyskxz.pojo.Carousel;
import cn.wmyskxz.pojo.ProductImage;

import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface CarouselImgService {

	List<Carousel> list();

    void save(Carousel carousel);
    
    int del(@Param("id")int id);
	
    
}
