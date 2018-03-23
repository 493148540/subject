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
import com.zm.platform.domain.Post;
import com.zm.platform.domain.User;
import com.zm.platform.querydomain.QueryPost;
import com.zm.platform.service.PostService;

@Controller
@RequestMapping("postmanage")
public class PostHandler extends BaseHandler<Post,QueryPost>{
	
	@Autowired
	private PostService postService;
	
	@ResponseBody
	@RequestMapping(value="insert",method=RequestMethod.POST)
	public Info edit(Post t,
			HttpServletRequest request) throws NoSuchAlgorithmException{
			User user = (User)request.getSession().getAttribute("user");
			
			t.setPostLastreply(user.getUserId());
			t.setPostLastreplyTime(getTime());
			t.setPostLookedNum(0);
			t.setPostParentId((long)0);
			t.setPostTime(getTime());
			t.setPostUserId(user.getUserId());
			t.setPostSubjectId((long)0);
			System.out.println("--------------");
		try{
			return new Info(service.insert(t),"编辑成功",200);
		}catch(Exception e){
			e.printStackTrace();
			return new Info(t,"编辑失败,系统抛出了异常:"+e,1);
		}
		
	} 
	
	@ResponseBody
	@RequestMapping(value="findbylist",method=RequestMethod.GET)
	public Map<String, Object> findByList(@RequestParam(required = false,value="page",defaultValue="1")int page,
							@RequestParam(required = false,value="page",defaultValue="10")int rows,
							QueryPost entity){
		entity.setPage((entity.getPage()-1)*entity.getRows());
		return postService.findAllDetailPost(entity);
		
		
	} 
}	
