package com.zm.platform.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


public interface Dao<T>{
	public Long insert(T t);	//添加
	public int update(T t);  //修改
	public int deleteById(Long id);
	public List<T> findAll();//查询全部
	
	public List<T> queryByList(Object query);//查询全部
	
	public T findById(Long id);//查询（根据id）
	public T findObject(T t);
	@Select("SELECT FOUND_ROWS()")
	public int getCount();
	
	public List<Object> getColumnKV();   //获取列名和注释 ，
	public int addTrainRecordBatch(List<T> list);
	public int updateNotNull(T t);
	@Update("${sql}")
	public void doSql(@Param("sql") String sql);
}
