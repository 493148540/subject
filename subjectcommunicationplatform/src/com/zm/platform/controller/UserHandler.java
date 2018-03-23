package com.zm.platform.controller;

import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zm.platform.domain.Info;
import com.zm.platform.domain.User;
import com.zm.platform.querydomain.QueryUser;
import com.zm.platform.service.UserService;
import com.zm.platform.util.MD5;







@Controller()
@RequestMapping(value = "/usermanage")
public class UserHandler extends BaseHandler<User,QueryUser>{
	
	@Autowired
	UserService service;
	
	@ResponseBody
	@RequestMapping(value="edit",method=RequestMethod.POST)
	public Info edit(User User,
			HttpServletRequest request) throws NoSuchAlgorithmException{
		if(User.getUserPassword().length()<32)
			User.setUserPassword(MD5.MD5_32bit1(User.getUserPassword()));
		if(service.updateExcludeNull(User)>0)
			return new Info(User,"编辑成功",200);
		else
			return new Info(User,"编辑失败",0);
		 
		
	} 
	
	
	@ResponseBody
	@RequestMapping(value="add",method=RequestMethod.POST)
	public Info add(User User,
			HttpServletRequest request) throws NoSuchAlgorithmException{
		if(User.getUserPassword().length()<32)
			User.setUserPassword(MD5.MD5_32bit1(User.getUserPassword()));
		if(service.insert(User).getUserId()>0)
			
		return new Info(User,"编辑成功",200);
		else
			return new Info(User,"编辑成功",200);
		
	}
	
	
}
