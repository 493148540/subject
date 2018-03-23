package com.zm.platform.dao;



import org.apache.ibatis.annotations.Select;

import com.zm.platform.domain.User;

public interface UserDao extends Dao<User>{
	
	@Select("select count(1) from user where username=#{username}")
	int findByName(String username);



}
