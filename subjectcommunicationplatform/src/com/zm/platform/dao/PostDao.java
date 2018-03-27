package com.zm.platform.dao;

import java.util.List;

import com.zm.platform.domain.Post;
import com.zm.platform.querydomain.QueryPost;

public interface PostDao extends Dao<Post> {
	
	public List<QueryPost> findAllDetailPost(Object obj);

	public List<QueryPost> findPostList(QueryPost entity);
}
