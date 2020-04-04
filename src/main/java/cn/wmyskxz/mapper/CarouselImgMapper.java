package cn.wmyskxz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.wmyskxz.pojo.Carousel;
import cn.wmyskxz.pojo.ProductImage;
import cn.wmyskxz.pojo.ProductImageExample;

public interface CarouselImgMapper {
	//保存商品
    void save(Carousel carousel);
    //查询商品
    List<Carousel> list();
	 
    int del(@Param("id")int id);
}
