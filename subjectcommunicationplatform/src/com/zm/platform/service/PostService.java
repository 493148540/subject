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
	public Map<String,Object> findAllDetailPost(QueryPost query){ //查询
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("rows",  postdao.findAllDetailPost(query));
		int total = postdao.getCount();
		
		map.put("total",  total);
		map.put("maxpage",  (int)Math.ceil((double)total/query.getRows()));
		return map;
	}

	@Transactional
	public Map<String, Object> findPostList(QueryPost entity) {
		// TODO Auto-generated method stub
		postdao.doLooked(entity.getPostId());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("rows",  postdao.findPostList(entity));
		int total = postdao.getCount();
		map.put("total",  total);
		map.put("maxpage",  (int)Math.ceil((double)total/entity.getRows()));
		return map;
	}
	/**
	 * 回复并修改主题回复数、最后回复时间等
	 * @param post
	 * @return 
	 */
	@Transactional
	public Post reply(Post post){
		postdao.insertById(post);
		
		Post parentpost = postdao.findById(post.getPostParentId());
		parentpost.setPostLastreply(post.getPostId());
		parentpost.setPostLastreplyTime(post.getPostTime());
		parentpost.setPostReplyNum(parentpost.getPostReplyNum()+1);
		postdao.updateNotNull(parentpost);
		return post;
	}
	
	
	
}
