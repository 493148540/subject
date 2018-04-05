package com.zm.platform.util;

import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Field;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.zm.platform.dao.Dao;
import com.zm.platform.domain.Dictionaries;
import com.zm.platform.domain.Post;
import com.zm.platform.domain.Res;
import com.zm.platform.domain.Subject;
import com.zm.platform.domain.TopicType;
import com.zm.platform.domain.User;








public class SqlUtils {
	
	@Test
	public void testgetSql11() throws IOException{
		
		getallsql(new Res());
		//getCreatetable(new Res());
		
	}
	public void testupdate(String sql) throws IOException{
		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		System.out.println("ctx---------------------------"+ctx);
		SqlSessionFactory sqlsessionfactory = (SqlSessionFactory) ctx.getBean("sqlSessionFactory");
		
		 SqlSession sqlsession = sqlsessionfactory.openSession();
		 
		 Dao stumapper = (Dao) sqlsession.getMapper(Dao.class);
	 
		try{
			stumapper.doSql(sql);
		//	sqlsession.commit();
		} catch(Exception e){
			e.printStackTrace();
		}finally{
			sqlsession.close();
		}		
	}
	@Transactional
	public String getCreatetable(Object obj) throws IOException{
		Class clazz = (Class) obj.getClass(); 
		StringBuffer str = new StringBuffer();
		String tablename = clazz.getSimpleName().toLowerCase();
		 Field[] fields = clazz.getDeclaredFields(); 
		//str.append("DROP TABLE IF EXISTS "+tablename+";");
		str.append("\n");
		str.append("CREATE TABLE "+tablename+"(");
		
		str.append("\n");
		str.append(""+fields[0].getName().toLowerCase()+" int(11) NOT NULL AUTO_INCREMENT,");
		str.append("\n");
		for(int i=1;i<fields.length;i++){
			String type=" varchar(32) ";
			String defaultvalue="DEFAULT  ''";
			if(!"java.lang.string".equals(fields[i].getType().getName().toLowerCase())){
				//System.out.println(fields[i].getType().getName().toLowerCase());
				type=" int(11) ";
				defaultvalue=" DEFAULT  0";
			}
					
			str.append(""+fields[i].getName().toLowerCase()+type+" NOT NULL "+defaultvalue+",");
			str.append("\n");
		}
		str.append("PRIMARY KEY ("+fields[0].getName().toLowerCase()+") )"
				+ " ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;");
		
		testupdate("DROP TABLE IF EXISTS "+tablename+";");
		testupdate(str.toString());
		return str.toString();
		
	}
	
	public  String getInsertSql(Object bean){
		 Class clazz = (Class) bean.getClass(); 
		 System.out.println(clazz.getSimpleName());
		 StringBuffer sql = new StringBuffer();
		 Field[] fields = clazz.getDeclaredFields(); 
		 sql.append(" <insert id=\"insert\" useGeneratedKeys=\"true\" keyProperty=\""+fields[0].getName()+"\"> \n");
		 sql.append("\t insert into ");
		 sql.append(clazz.getSimpleName().toLowerCase());
		 StringBuffer sqlcolumn = new StringBuffer("(");
		 StringBuffer sqlvalue = new StringBuffer("\n \t values(");
		 
		 int i=0;
		 for(i=0;i<fields.length-1;i++){
			 if(fields[i].getName()=="id")
				 continue;
			 sqlcolumn.append(fields[i].getName());
			 sqlcolumn.append(" , ");
			 sqlvalue.append("#{");
			 sqlvalue.append(fields[i].getName());
			 sqlvalue.append("} , ");
			 
		 }
		 sqlcolumn.append(fields[i].getName());
		 sqlcolumn.append(" )");
		 sqlvalue.append("#{");
		 sqlvalue.append(fields[i].getName());
		 sqlvalue.append("} )");
		 sqlvalue.append("\n</insert>");
		 sql.append(sqlcolumn);
		 sql.append(" ");
		 sql.append(sqlvalue);
		 sql.append("");
		 
		return sql.toString();
	}
	
	public  String getUpdateSql(Object bean){
		 Class clazz = (Class) bean.getClass(); 
		 //System.out.println(clazz.getSimpleName());
		 StringBuffer sql = new StringBuffer();
		 sql.append(" <update id=\"update\" parameterType=\"Object\"> ");
		 sql.append(" \n\tupdate ");
		 sql.append(clazz.getSimpleName().toLowerCase());
		 sql.append(" ");
		 StringBuffer sqlcolumn = new StringBuffer(" set ");
		 Field[] fields = clazz.getDeclaredFields();  
		 int i=0;
		 for(i=0;i<fields.length-1;i++){
			 
			 sqlcolumn.append(fields[i].getName());
			 sqlcolumn.append(" = ");
			 sqlcolumn.append("#{");
			 sqlcolumn.append(fields[i].getName());
			 sqlcolumn.append("} , ");
			
			 
		 }
		 sqlcolumn.append(fields[i].getName());
		 sqlcolumn.append(" = ");
		 sqlcolumn.append("#{");
		 sqlcolumn.append(fields[i].getName());
		 sqlcolumn.append("} ");
		
		 sql.append(sqlcolumn);
		 sql.append(" \n\twhere "+fields[0].getName()+" = #{"+fields[0].getName()+"} ");
		 sql.append("  \n</update> ");
		 
		 
		return sql.toString();
	}
	
	public String getDelete(Object bean){
		 Class clazz = (Class) bean.getClass(); 
		 
		 StringBuffer sql = new StringBuffer();
		 Field[] fields = clazz.getDeclaredFields(); 
		// fields[0].getName();
		 sql.append("\n<delete id=\"deleteById\">");
		 sql.append("\n\tdelete from "+clazz.getSimpleName().toLowerCase()+" where "+fields[0].getName()+" = #{"+fields[0].getName()+"}");
		 sql.append("\n</delete>");
		 return sql.toString();
	}
	public String getAll(Object bean){
		Class clazz = (Class) bean.getClass(); 
		 
		 StringBuffer sql = new StringBuffer();
		 Field[] fields = clazz.getDeclaredFields(); 
		sql.append("\n<select id=\"findAll\" resultType=\""+clazz.getName()+"\">");
		 sql.append("\n\t select * from "+clazz.getSimpleName().toLowerCase()+"");
		 sql.append("\n</select>");
		return sql.toString();
		
	}
	public String getbyid(Object bean){
		Class clazz = (Class) bean.getClass(); 
		 
		 StringBuffer sql = new StringBuffer();
		 Field[] fields = clazz.getDeclaredFields(); 
		sql.append("\n<select id=\"findById\" resultType=\""+clazz.getName()+"\">");
		 sql.append("\n\t select * from "+clazz.getSimpleName().toLowerCase()+" where "+fields[0].getName()+"=#{"+fields[0].getName()+"}");
		 sql.append("\n</select>");
		return sql.toString();
		
	}
	
	public String getFindObject(Object bean){
		Class clazz = (Class) bean.getClass(); 
		 
		 StringBuffer sql = new StringBuffer();
		 Field[] fields = clazz.getDeclaredFields(); 
		sql.append("\n<select id=\"findObject\" resultType=\""+clazz.getName()+"\"  parameterType=\"Object\">");
		 sql.append("\n\t select  * from "+clazz.getSimpleName().toLowerCase()+"");
		 sql.append("\n\t<include refid=\"Example_Where_Clause\" />");
		 sql.append("\norder by "+fields[0].getName()+" desc limit 0,1");
		 sql.append("\n</select>");
		
		
		return sql.toString();
		
	}
	public String getbylist(Object bean){
		Class clazz = (Class) bean.getClass(); 
		 
		 StringBuffer sql = new StringBuffer();
		 Field[] fields = clazz.getDeclaredFields(); 
		sql.append("\n<select id=\"queryByList\" resultType=\""+clazz.getName()+"\"  parameterType=\"Object\">");
		 sql.append("\n\t select SQL_CALC_FOUND_ROWS * from "+clazz.getSimpleName().toLowerCase()+"");
		 sql.append("\n\t<include refid=\"Example_Where_Clause\" />");
		 sql.append("\n\t<include refid=\"sortsql\" />");
		 sql.append("\n</select>");
		 sql.append("\n<sql id=\"sortsql\">");
		 sql.append("\n\t<trim >");
		 sql.append("\n\t\t<if test=\"sort != null  and sort!=''  and order!=null and order!=''\">");
		 sql.append("\n\t\t\torder by ${sort}   ${order} ");
		 sql.append("\n\t\t</if>");
		
		 sql.append("\n\t\t<if test=\"page != null and rows!=null\">");
		 sql.append("\n\t\t\tlimit #{page} ,#{rows}");
		 sql.append("\n\t\t</if>");
		 sql.append("\n\t</trim>");
		 sql.append("\n</sql>");
		
		return sql.toString();
		
	}
	
	public String getQueryParam(Object bean){
		 Class clazz = (Class) bean.getClass(); 
		 System.out.println(clazz.getSimpleName());
		 StringBuffer sql = new StringBuffer();
		 Field[] fields = clazz.getDeclaredFields(); 
		 sql.append(" <sql id=\"Example_Where_Clause\"> \n");
		 sql.append("\t where 1=1 ");
		 sql.append("\n<trim  suffixOverrides=\",\" >");
		
		 
		 int i=0;
		 for(i=0;i<fields.length;i++){
			 if("class java.lang.string".equals(fields[i].getType().toString().toLowerCase())==true)
				 sql.append("\n\t<if test=\""+fields[i].getName()+" != null and "+fields[i].getName()+" != ''\" >");
			 else
				 sql.append("\n\t<if test=\""+fields[i].getName()+" != null and "+fields[i].getName()+" != 0\" >");
			 sql.append("\n\t\t and "+fields[i].getName()+" =  #{"+fields[i].getName()+"}");
			 sql.append("\n\t</if>");
		 }
		 
		 sql.append("\n</trim>");
		 sql.append("\n</sql>");
		return sql.toString();
	}
	public String getUpdatenotnull(Object bean){
		Class clazz = (Class) bean.getClass(); 
		 System.out.println(clazz.getSimpleName());
		
		 Field[] fields = clazz.getDeclaredFields(); 
		
		StringBuffer str = new StringBuffer("");
		str.append("\n	<update id=\"updateNotNull\" parameterType=\"Object\">");
		str.append("\n\t	update "+clazz.getSimpleName()+"  set   <include refid=\"Update_Column\" />");
		str.append("\n\t	where "+fields[0].getName()+" = #{"+fields[0].getName()+"}");
		str.append("\n	</update>");
		return str.toString();
		
	}
	public String getUpdateColomn(Object bean){
		 Class clazz = (Class) bean.getClass(); 
		 System.out.println(clazz.getSimpleName());
		 StringBuffer sql = new StringBuffer();
		 Field[] fields = clazz.getDeclaredFields(); 
		 sql.append(" <sql id=\"Update_Column\"> \n");
		 sql.append("\t "+fields[0].getName()+"=#{"+fields[0].getName()+"} ");
		
		
		 
		 int i=1;
		 for(i=1;i<fields.length;i++){
			 if("class java.lang.string".equals(fields[i].getType().toString().toLowerCase())==true)
				 sql.append("\n\t<if test=\""+fields[i].getName()+" != null and "+fields[i].getName()+" != ''\" >");
			 else
				 sql.append("\n\t<if test=\""+fields[i].getName()+" != null and "+fields[i].getName()+" != 0\" >");
			 sql.append("\n\t\t , "+fields[i].getName()+" =  #{"+fields[i].getName()+"}");
			 sql.append("\n\t</if>");
		 }
		 
		
		 sql.append("\n</sql>");
		return sql.toString();
	}

	
	public String getallsql(Object user){
		//User user = new User();
		Class clazz = (Class) user.getClass(); 
		StringBuffer str = new StringBuffer();
		str.append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n");
		
		str.append("<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\" \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\n");
		str.append("<mapper namespace=\"com.zm.platform.dao."+clazz.getSimpleName()+"Dao\">\n");
		str.append(getInsertSql(user)+"\n");
		str.append(getDelete(user)+"\n");
		str.append(getUpdateSql(user)+"\n");
		str.append(getUpdatenotnull(user)+"\n");
		str.append(getUpdateColomn(user)+"\n");
		str.append(getAll(user)+"\n");
		str.append(getbyid(user)+"\n");
		str.append(getbylist(user)+"\n");
		str.append(getQueryParam(user)+"\n");
		str.append(getFindObject(user)+"\n");
		str.append("</mapper>");
		try {
			FileWriter fw=new FileWriter("D:/Mapper/"+clazz.getSimpleName()+"Mapper.xml");
			fw.write(str.toString());
			fw.close();
			} catch (IOException e) {
			e.printStackTrace();
			}
		return str.toString();
	}
	@Test
	public void testgetupdateSql(){
		
	}
	
	
	public void setOrders(Object bean){
		Class clazz = (Class) bean.getClass(); 
		 System.out.println(clazz.getSimpleName());
		 Field[] fields = clazz.getDeclaredFields(); 
		 for(int i=0;i<fields.length-1;i++){
			// fields[i].set("", "");
		 }
	}
	
	
	
	
	
}
