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
import com.zm.platform.dao.SubjectDao;
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
		SubjectDao stumapper = (SubjectDao) sqlsession.getMapper(SubjectDao.class);
		
		
		
		System.out.println("------------"+stumapper.getSubjectsMenu());
	}
	
	
	@Test
	public void testtime(){
		System.out.println("saasass..sddsd.s....RAR".replaceAll("^[\\S]*[\\.]", "").toLowerCase());
	}
	
	@Test
	public void testmath(){
		String s = "1234";
		Integer ss = 1234;
		System.out.println(Integer.bitCount(ss));
		System.out.println(Math.ceil((double)5/2));   //2
		System.out.println(Math.floor(5/2)); 	
	}
	    
	
}
