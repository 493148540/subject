package com.zm.platform.service;



import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zm.platform.dao.UserDao;
import com.zm.platform.domain.Info;
import com.zm.platform.domain.User;
import com.zm.platform.util.MD5;




@Service
public class UserService extends BaseService<User>{

	@Autowired
	private UserDao userDao;
	
	public User login(String username, String password) throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUserName(username);
		user.setUserPassword(MD5.MD5_32bit(password));
		
		return userDao.findObject(user);
	}
	
	public Info regist(String username, String password,String repassword) throws NoSuchAlgorithmException {
		
		
		// TODO Auto-generated method stub
		
		if(username.length()==0||password.length()==0||repassword.length()==0)
			return new Info(null,"修改失败，缺少必选参数",200);
		if(!password.equals(repassword)){
			return new Info(null,"注册失败，两次输入的密码不一致",0);
		}
		if(userDao.findByName(username)>0){
			return new Info(null,"注册失败，用户名已存在",0);
		}
		User user = new User();
		user.setUserName(username);
		user.setUserPassword(MD5.MD5_32bit(password));
		user.setUserEmail("");
		user.setUserRoleId(1);
		user.setUserHead("upload/image/noavatar_middle.gif");
		try{
			userDao.insert(user);
			return new Info(user,"注册成功",200);
		}catch(Exception e){
			return new Info(null,"注册失败，系统抛出了以下错误"+e.getMessage(),0);
		}
		
		
	}
	public User findBytoken(String token) {
		// TODO Auto-generated method stub
		User user = new User();
	
		return userDao.findObject(user);
	}

	public Info changePassword(User user,String password, String repassword) throws NoSuchAlgorithmException {
		if(password.length()==0||repassword.length()==0)
			return new Info(null,"修改失败，缺少必选参数",0);
		if(!password.equals(repassword)){
			return new Info(null,"修改失败，两次输入的密码不一致",0);
		}
		user.setUserPassword(MD5.MD5_32bit(password));
		
		try{
			userDao.updateNotNull(user);
			return new Info(user,"修改成功",200);
		}catch(Exception e){
			return new Info(null,"修改失败，服务器内部错误",0);
		}
		
	}

}
