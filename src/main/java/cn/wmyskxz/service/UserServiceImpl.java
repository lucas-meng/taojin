package cn.wmyskxz.service;

import cn.wmyskxz.mapper.UserMapper;
import cn.wmyskxz.pojo.Address;
import cn.wmyskxz.pojo.User;
import cn.wmyskxz.pojo.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * UserService 实现类
 *
 * @author: @MPengYu
 * @create: 2019-04-29-上午 9:47
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;

	@Override
	public List<User> list() {
		UserExample example = new UserExample();
		return userMapper.selectByExample(example);
	}

	@Override
	public void updateUser(int id,String name, String password) {
		User user = get(id);
		user.setPassword(password);
		userMapper.updateByPrimaryKey(user);
	}

	@Override
	public User get(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public User get(String name, String password) {
		UserExample example = new UserExample();
		example.or().andNameEqualTo(name).andPasswordEqualTo(password);
		List<User> result = userMapper.selectByExample(example);
		if (result.isEmpty())
			return null;
		return result.get(0);
	}

	@Override
	public boolean isExist(String name) {
		UserExample example =new UserExample();
		example.or().andNameEqualTo(name);
		List<User> result= userMapper.selectByExample(example);
		if(!result.isEmpty())
			return true;
		return false;
	}

	

	@Override
	public User personalCenter(String user_name) {
		// TODO Auto-generated method stub
		return userMapper.personalCenter(user_name);
	}

	@Override
	public String getId(String user_name) {
		// TODO Auto-generated method stub
		return userMapper.getId(user_name);
	}

	@Override
	public int updatePersonalCenter(String user_id, String user_pwd) {
		// TODO Auto-generated method stub
		return userMapper.updatePersonalCenter(user_id, user_pwd);
	}

	@Override
	public List<Address> personalAddress(String user_id) {
		// TODO Auto-generated method stub
		return userMapper.personalAddress(user_id);
	}

	@Override
	public int addAddressGo(Address address) {
		// TODO Auto-generated method stub
		return userMapper.addAddressGo(address);
	}

	@Override
	public int delAddress(Address address) {
		// TODO Auto-generated method stub
		return userMapper.delAddress(address);
	}
	@Override
	public void add(User user) {
		userMapper.insert(user);
	}



	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		userMapper.deleteByPrimaryKey(id);
	}

	
	
}
