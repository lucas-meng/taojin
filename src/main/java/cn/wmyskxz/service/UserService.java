package cn.wmyskxz.service;

import cn.wmyskxz.pojo.Address;
import cn.wmyskxz.pojo.Admin;
import cn.wmyskxz.pojo.User;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserService {

	/**
	 * 返回所有的用户
	 *
	 * @return
	 */
	List<User> list();

	/**
	 * 更改用户密码
	 *
	 * @param id
	 * @param password
	 */
	void updateUser(int id,String name, String password);

	/**
	 * 根据id获取用户
	 *
	 * @param id
	 * @return
	 */
	User get(Integer id);

	/**
	 * 根据用户名和密码来查询用户
	 *
	 * @param name
	 * @param password
	 * @return
	 */
	User get(String name, String password);

	/**
	 * 根据用户名判断用户是否存在
	 *
	 * @param name
	 * @return
	 */
	boolean isExist(String name);

	/**
	 * 增加一条用户数据
	 *
	 * @param user
	 */
	void add(User user);
	
	User personalCenter(@Param("user_name")String user_name);
	
	String getId(@Param("user_name")String user_name);
	
	int updatePersonalCenter(@Param("user_id")String user_id,@Param("user_pwd")String user_pwd);

	List<Address> personalAddress(@Param("user_id")String user_id);

	int addAddressGo(Address address);
	
	int delAddress(Address address);
	
	void delete(Integer id);

}
