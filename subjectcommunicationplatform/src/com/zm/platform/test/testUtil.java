package com.zm.platform.test;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.zm.platform.dao.Dao;
import com.zm.platform.dao.PostDao;
import com.zm.platform.dao.TopicTypeDao;
import com.zm.platform.domain.TopicType;
import com.zm.platform.querydomain.QueryPost;



public class testUtil {
	@Test
	@Transactional
	public void testtopic(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		System.out.println("ctx---------------------------"+ctx);
		SqlSessionFactory sqlsessionfactory = (SqlSessionFactory) ctx.getBean("sqlSessionFactory");
		SqlSession sqlsession = sqlsessionfactory.openSession();
		PostDao stumapper = (PostDao) sqlsession.getMapper(PostDao.class);
		QueryPost post = new QueryPost();
		post.setPage(2);
		post.setPage(post.getRows()*(post.getPage()-1));
		post.setRows(10);
		
		System.out.println("------------"+stumapper.findAllDetailPost(post));
	}
	
	
	@Test
	public void testtime(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("当前时间：" + sdf.format(d));
	}
	
	    
	
}
