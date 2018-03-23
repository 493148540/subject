package com.zm.platform.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zm.platform.dao.PostDao;
import com.zm.platform.domain.Post;
import com.zm.platform.querydomain.QueryPost;

@Service
public class PostService extends BaseService<Post>{
	@Autowired 
	private PostDao postdao; 
	
	@Transactional
	public Map<String,Object> findAllDetailPost(Object query){ //查询
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("rows",  postdao.findAllDetailPost(query));
		map.put("total",  postdao.getCount());
		return map;
	}
	
}
