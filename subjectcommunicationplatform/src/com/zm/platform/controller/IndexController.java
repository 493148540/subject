package com.zm.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zm.platform.domain.Dictionaries;
import com.zm.platform.domain.Post;
import com.zm.platform.domain.Subject;
import com.zm.platform.domain.TopicType;
import com.zm.platform.querydomain.QueryDictionaries;
import com.zm.platform.querydomain.QueryPost;
import com.zm.platform.querydomain.QueryRes;
import com.zm.platform.service.DictionariesService;
import com.zm.platform.service.PostService;
import com.zm.platform.service.ResService;
import com.zm.platform.service.SubjectService;
import com.zm.platform.service.TopicTypeService;

@Controller
public class IndexController {
	
	@Autowired TopicTypeService topicTypeService;
	@Autowired PostService postService;
	@Autowired  SubjectService subjectService;
	@Autowired	DictionariesService dictionariesService;
	@Autowired ResService resService;
	@RequestMapping("index")
	public ModelAndView index(QueryPost post){
		System.out.println("-----------index");
		Map<String,Object> modelmap= new HashMap<String,Object>();
		modelmap.put("topic",topicTypeService.findAll());
		modelmap.put("thispage", post.getPage());
		post.setPostParentId((long)0);
		post.setRows(10);
		post.setPage((post.getPage()-1)*post.getRows());
		post.setOrder("desc");
		post.setSort("postLastreplyTime");

		modelmap.put("postlist", postService.findAllDetailPost(post));
		modelmap.put("param", post);
								 
		return new ModelAndView("index",modelmap);
	}
	
	
	@RequestMapping("forum-{subjectid}-{page}")
	public ModelAndView forum(QueryPost post,
			@PathVariable long subjectid,
			@PathVariable int page){
		System.out.println("-----------index");
		Map<String,Object> modelmap= new HashMap<String,Object>();
		modelmap.put("topic",topicTypeService.findBySubjectid(subjectid));
		modelmap.put("thispage", page);
		post.setTopicTypeSubjectId(subjectid);
		post.setPostParentId((long)0);
		post.setRows(10);
		post.setPage((page-1)*post.getRows());
		post.setOrder("desc");
		post.setSort("postLastreplyTime");
		modelmap.put("subjectid", subjectid);
		modelmap.put("subjectlist", subjectService.getSubjectsMenu());
		modelmap.put("list", postService.findAllDetailPost(post));
		modelmap.put("param", post);
		
		return new ModelAndView("index",modelmap);
	}
	
	
	@RequestMapping("newfile")
	public ModelAndView newfile(QueryPost post){
		System.out.println("-----------index");
		Map<String,Object> modelmap= new HashMap<String,Object>();
		modelmap.put("topic",topicTypeService.findAll());
		modelmap.put("thispage", post.getPage());
		post.setPostParentId((long)0);
		post.setRows(20);
		post.setPage((post.getPage()-1)*post.getRows());
		post.setOrder("desc");
		post.setSort("postLastreplyTime");
		modelmap.put("postlist", postService.findAllDetailPost(post));
		modelmap.put("param", post);
								 
		return new ModelAndView("newfile",modelmap);
	}
	
	/**
	 * 获取指定id的帖子
	 * @param id
	 * @param page
	 * @return
	 */
	@RequestMapping(value="thread-{id}-{page}",method=RequestMethod.GET)
	public ModelAndView findPostList(@PathVariable int id,
											@PathVariable int page,
											QueryPost entity)
	{
		ModelAndView model = new ModelAndView("postdetail");
		Map<String,Object> map = model.getModel();
		System.out.println("-------"+entity.getPostUserId()+(entity.getPostUserId()!=null));
		
		map.put("thispage",page);
		entity.setRows(5);
		
		entity.setPage((page-1)*entity.getRows());
		entity.setPostId((long)id);
		System.out.println("-------"+entity.getPostUserId()+(entity.getPostUserId()!=null));
		if(entity.getPostUserId()!=null)
			map.put("queryparam","postUserId="+entity.getPostUserId());
		else
			map.put("queryparam","");
		map.put("postid",id);
		map.put("postlist",postService.findPostList(entity));
		
		return model;
	}
	
	
	@RequestMapping(value="registview")
	public String registview()
	{
		return "regist";
	}
	
	@RequestMapping(value="fileview-{subjectid}-{restypeid}")
	public ModelAndView fileview(
			@PathVariable("subjectid") Long subjectid,
			@PathVariable("restypeid") Long restypeid
			)
	{
		ModelAndView model = new ModelAndView("fileview");
		Map<String,Object> map = model.getModel();
		map.put("subjectlist", subjectService.findAll());
		QueryDictionaries dictionaries = new QueryDictionaries();
		dictionaries.setRows(99999);
		dictionaries.setDictionariesTypeCode("resType");
		map.put("restype", dictionariesService.findByList(dictionaries));
		QueryRes res = new QueryRes();
		res.setResSubjectId(subjectid);
		res.setResTypeId(restypeid);
		res.setPage((res.getPage()-1)*res.getRows());
		map.put("list", resService.findByList(res));
		return model;
	}
}
