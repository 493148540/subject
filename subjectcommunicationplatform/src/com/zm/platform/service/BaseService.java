package com.zm.platform.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.zm.platform.dao.Dao;
import com.zm.platform.domain.Post;
import com.zm.platform.querydomain.QueryPage;



public class BaseService<T> {
	@Autowired
	private Dao<T> dao;
	
	public T insert(T t){
		dao.insert(t);
		return t;
		
	}	//添加
	public int update(T t){//修改
		return dao.update(t);
	}  
	public int updateExcludeNull(T t){//修改
		return dao.updateNotNull(t);
	}
	public int deleteById(Long id){
		return dao.deleteById(id);
		
	}
		//修改
	public List<T> findAll(){
		return dao.findAll();//查询全部
		
	}
	
	@Transactional
	public <E extends QueryPage> Map<String,Object> findByList(E	 query){ //查询
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("rows",  dao.queryByList(query));
		
		int total = dao.getCount();
		map.put("total",  total);
		map.put("maxpage",  (int)Math.ceil((double)total/query.getRows()));
		map.put("total",  dao.getCount());
		return map;
		
	}
	
	public T findById(Long id){
		return dao.findById(id);//查询（根据id）
		
	}
	
	public T findObject(T t){
		return dao.findObject(t);
		
	}
	public Long insertById(Post t) {
		// TODO Auto-generated method stub
		return dao.insertById(t);
	}
}
