package com.zm.platform.controller;

import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zm.platform.domain.Info;
import com.zm.platform.querydomain.QueryPage;
import com.zm.platform.service.BaseService;

public class BaseHandler<T,E extends QueryPage> {
	@Autowired
	protected BaseService<T> service;
	
	
	@ResponseBody
	@RequestMapping(value="edit",method=RequestMethod.POST)
	public Info edit(T t,
			HttpServletRequest request) throws NoSuchAlgorithmException{
		
			
		try{
			return new Info(service.updateExcludeNull(t),"编辑成功",200);
		}catch(Exception e){
			return new Info(t,"编辑失败,系统抛出了异常:"+e,1);
		}
		
	} 
	@ResponseBody
	@RequestMapping(value="add",method=RequestMethod.POST)
	public Info add(T t,
			HttpServletRequest request) throws NoSuchAlgorithmException{
		
			try{
				return new Info(service.insert(t),"编辑成功",200);
			}catch(Exception e){
				return new Info(t,"编辑失败,系统抛出了异常:"+e,1);
			}
	
	}
	@ResponseBody
	@RequestMapping(value="remove",method=RequestMethod.POST)
	public Info remove(@RequestParam(required = true,value="id")Long id){
		
		try{
			if(service.deleteById(id)>0)
				return new Info(service.deleteById(id),"删除成功",200);	
			else
				return new Info(false,"删除成功",200);	
		}catch(Exception e){
			return new Info(false,"编辑失败,系统抛出了异常:"+e,1);
		}
		
	} 
	@ResponseBody
	@RequestMapping(value="findbylist",method=RequestMethod.GET)
	public Map<String, Object> findByList(@RequestParam(required = false,value="page",defaultValue="1")int page,
							@RequestParam(required = false,value="page",defaultValue="10")int rows,
							E entity){
		entity.setPage((entity.getPage()-1)*entity.getRows());
		return service.findByList(entity);
		
		
	} 
	@ResponseBody
	@RequestMapping(value="findbyid",method=RequestMethod.GET)
	public Info findById(Long id){
		
		return new Info(service.findById(id),"查询成功",200);
	} 
	
	/**
	 * 获取当前时间 'yyyy-mm-dd hh:mm:ss'
	 * @return
	 */
	public String getTime(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(d);
	}
}
