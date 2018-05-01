package com.zm.platform.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zm.platform.domain.DownLoadRecord;
import com.zm.platform.domain.Res;
import com.zm.platform.domain.User;
import com.zm.platform.querydomain.QueryDictionaries;
import com.zm.platform.querydomain.QueryPost;
import com.zm.platform.querydomain.QueryRes;
import com.zm.platform.service.DictionariesService;
import com.zm.platform.service.DownLoadRecordService;
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
	@Autowired DownLoadRecordService downLoadRecordService;
	
	@RequestMapping("index")
	public ModelAndView index(QueryPost post){
		System.out.println("-----------index");
		
		Map<String,Object> modelmap= new HashMap<String,Object>();
		
		modelmap.put("topic",topicTypeService.findBySubjectid(3));
		modelmap.put("thispage", 1);
		post.setTopicTypeSubjectId((long)3);
		post.setPostParentId((long)0);
		post.setRows(10);
		post.setPage((1-1)*post.getRows());
		post.setOrder("desc");
		post.setSort("postLastreplyTime");
		modelmap.put("subjectid", 3);
		modelmap.put("subjectlist", subjectService.getSubjectsMenu());
		modelmap.put("list", postService.findAllDetailPost(post));
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
	
	@RequestMapping(value="fileview-{subjectid}-{restypeid}-{page}")
	public ModelAndView fileview(
			@PathVariable("subjectid") Long subjectid,
			@PathVariable("restypeid") Long restypeid,
			@PathVariable("page") int page,
			QueryRes res
			)
	{
		ModelAndView model = new ModelAndView("fileview");
		Map<String,Object> map = model.getModel();
		map.put("subjectlist", subjectService.findAll());
		QueryDictionaries dictionaries = new QueryDictionaries();
		dictionaries.setRows(99999);
		dictionaries.setDictionariesTypeCode("resType");
		map.put("restype", dictionariesService.findByList(dictionaries));
		map.put("subjectid", subjectid);
		map.put("restypeid", restypeid);
		map.put("thispage", page);
		res.setResSubjectId(subjectid);
		res.setResTypeId(restypeid);
		res.setPage((page-1)*res.getRows());
		map.put("list", resService.findByList(res));
		return model;
	}
	@RequestMapping("download-{id}")
	public void test(@PathVariable("id") long id,HttpServletRequest request ,HttpServletResponse response) throws IOException{
		Res res = resService.findById(id);
		User user = (User)request.getSession().getAttribute("user");
		
			
		try{
			DownLoadRecord record = downLoadRecordService.findObject(new DownLoadRecord(null, res.getResId(), user.getUserId()));
			if(user==null||(user.getUserResPoint()<res.getResPoint())&&record==null){
				response.sendError(4001);
				return;
			}
			resService.download(res, request, response);
			if(record==null)
			resService.doChangePoint(res,user);
		}catch(Exception e){
			//response.setStatus(404);
			response.sendError(410);
		}
		
		
	}
	
	@RequestMapping("filedetail-{id}")
	public ModelAndView filedetail(@PathVariable("id") long id,HttpServletRequest request ,HttpServletResponse response){
		ModelAndView modelview = new ModelAndView("filedetail");
		Map<String,Object> modelmap = modelview.getModel();
		Res res = resService.findById(id);
		modelmap.put("res",res);
		
		return modelview;
				
	}
	@RequestMapping("usercenter")
	public ModelAndView usercenter(){
		ModelAndView modelview = new ModelAndView("usercenter");
		
		
		return modelview;
				
	}
	
	@RequestMapping("manageindex")
	public ModelAndView manageindex(){
		ModelAndView modelview = new ModelAndView("manage/index");
		return modelview;
		
	}
	
	
}
