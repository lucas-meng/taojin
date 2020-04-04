package cn.wmyskxz.service;

import cn.wmyskxz.mapper.CarouselImgMapper;
import cn.wmyskxz.mapper.CategoryMapper;
import cn.wmyskxz.pojo.Admin;
import cn.wmyskxz.pojo.Carousel;
import cn.wmyskxz.pojo.Category;
import cn.wmyskxz.pojo.CategoryExample;
import cn.wmyskxz.pojo.ProductImage;
import cn.wmyskxz.pojo.ProductImageExample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * CategoryService 的实现类
 *
 * @author: @MPengYu
 * @create: 2019-04-27-下午 16:35
 */
@Service
public class CarouselImgServiceImpl implements CarouselImgService {
	//注入ProductMapper
	@Autowired
	CarouselImgMapper carouselImgMapper;

	@Override
	public List<Carousel> list() {
		// TODO Auto-generated method stub
		return carouselImgMapper.list();
	}

	@Override
	public void save(Carousel carousel) {
		// TODO Auto-generated method stub
		carouselImgMapper.save(carousel);
	}

	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		return carouselImgMapper.del(id);
	}

	
	
}
