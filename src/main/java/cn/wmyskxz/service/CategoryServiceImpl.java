package cn.wmyskxz.service;

import cn.wmyskxz.mapper.CategoryMapper;
import cn.wmyskxz.pojo.Admin;
import cn.wmyskxz.pojo.Category;
import cn.wmyskxz.pojo.CategoryExample;
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
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryMapper categoryMapper;

	public List<Category> list() {
		CategoryExample example = new CategoryExample();
		List<Category> categories = categoryMapper.selectByExample(example);
		return categories;
	}

	public Category get(Integer id) {
		return categoryMapper.selectByPrimaryKey(id);
	}

	public void update(Category category) {
		categoryMapper.updateByPrimaryKey(category);
	}
	
	@Override
	public Admin selAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return categoryMapper.selAdmin(admin);
	}




}
