package com.zm.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zm.platform.domain.Post;
import com.zm.platform.domain.TopicType;
import com.zm.platform.querydomain.QueryPost;
import com.zm.platform.service.PostService;
import com.zm.platform.service.TopicTypeService;

@Controller
public class IndexController {
	
	@Autowired TopicTypeService topicTypeService;
	@Autowired PostService postService;
	@RequestMapping("index")
	public String index(){
		System.out.println("-----------index");
		return "index";
	}
	
	
	@RequestMapping("forum")
	public ModelAndView forum(QueryPost post){
		System.out.println("-----------index");
		Map<String,Object> modelmap= new HashMap<String,Object>();
		modelmap.put("topic",topicTypeService.findAll());
		modelmap.put("thispage", post.getPage());
		post.setRows(20);
		post.setPage((post.getPage()-1)*post.getRows());
		modelmap.put("postlist", postService.findAllDetailPost(post));
		modelmap.put("param", post);
		
		
		return new ModelAndView("forum",modelmap);
	}
}
