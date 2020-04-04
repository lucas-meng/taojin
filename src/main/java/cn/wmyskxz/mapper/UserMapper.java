package cn.wmyskxz.mapper;

import cn.wmyskxz.pojo.Address;
import cn.wmyskxz.pojo.User;
import cn.wmyskxz.pojo.UserExample;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User personalCenter(@Param("user_name")String user_name);
    
    String getId(@Param("user_name")String user_name);
    
    int updatePersonalCenter(@Param("user_id")String user_id,@Param("user_pwd")String user_pwd);

    List<Address> personalAddress(@Param("user_id")String user_id);
    
    int addAddressGo(Address address);
    
    int delAddress(Address address);
}