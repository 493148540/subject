package com.zm.platform.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.zm.platform.dao.SubjectDao;



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
		System.out.println("AWUBBWUBCWUBD".replaceAll("WUB", "").toLowerCase());
	}
	
	@Test
	public void testmath(){
		String s = "1234";
		Integer ss = 1234;
		System.out.println(Integer.bitCount(ss));
		System.out.println(Math.ceil((double)5/2));   //2
		System.out.println(Math.floor(5/2)); 	
	}
	    
	
	public static double testchar(double m){
		
		long sum=0;
	    long i=1;
	    while(true){
	      sum+=i*i*i;
	      if(sum==m){
	    	  return i;
	      }
	     
	      else if(sum<m){
	    	  if(sum<0){
	    		  System.out.println(sum);
	    		  return -1;
	    	  }
	    		  
	    	  i++;
	      }
	      
	      else{
	    	  //System.out.println(i);
	    	  return -1;  
	      }
	      
	      }
	}
	@Test
	public void test11(){
		System.out.println(testchar(1639443903827444100L));
		List<String> list = new ArrayList<String>();
		String[] array = new String[list.size()];
		list.toArray(array);
	}
	@Test
	public void test12(){
		//System.out.println(testchar(2134674688278339217L));
		System.out.println(50604*50604*50604);
		long sum=0;
		for(long i=1;i<=50604;i++){
			sum+=i*i*i;
		}
		System.out.println(sum);
	}
	
	public static Integer[] inArray(String[] array1, String[] array2) {
		  
		List<String> list = new LinkedList<String>();
		      for(int i=0;i<array1.length;i++){
		        for(int j=0;j<array2.length;j++){
		          if(array2[j].replace(array1[i],"").length()!=array2[j].length()){
		        	  int x= 0;
		        	  	for(int z=0;z<list.size();z++){
		                  if(list.get(z).equals(array1[i]))
		                  x=1;
		                }
		        	  	if(x==0)
		        	  list.add(array1[i]);
		            
		            break;
		          }
		        } 
		      }    
		      list.stream().toArray(Integer[]::new);
				 return list.toArray(new Integer[5]);
			}
	
	@Test
	public void test1() {
		String a[] = new String[]{ "arp", "live", "strong","strong" };
    	String b[] = new String[] { "arp", "alsdive", "harp", "sharp", "armstrong" };
    	String r[] = new String[] { "arp", "live", "strong" };

    	//Arrays.stream(a).filter(str->Arrays.stream(b).anyMatch(s->s.contains(str))).toArray(String[]::new);
    	
    	Arrays.stream(a).filter(
    			str->
    			Arrays.stream(b).anyMatch(s->s.contains(str)))
    			.distinct()
    			.sorted()
    			.toArray(String[]::new);
    	
    	List<String> list = new ArrayList<String>();
    	list.add("I am a boy");
    	list.add("I love the girl");
    	list.add("But the girl loves another girl");
    	list.stream().map(e->e.split(" ")).flatMap(Arrays::stream).forEach(e->System.out.println(e));
    	//System.out.println("dsdsgfg".contains("s"));
	}
	
	@Test
	public void test2(){
		String s = "2";
		String ss = "ewar";
		String s2 = "wars";
		String s3 = "wars";
		System.out.println("2".replace("[2]", "a"));
		System.out.println();
	}
	
	@Test
	public void testfile(){
		
		File file = new File("a.jsp");
		try {
			InputStream in = new FileInputStream(file);
			System.out.println(file);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Test
	public void ADDsqlutil(){
		String s = "PKID,STANDENTERID ,ENTERID ,DATATYPE,YEAR ,QUARTER  ,MONTH  ,DAY ,TOTALUSEDWATER  ,WATERUNIT,"+
				"NEWWATER ,NEWTAPWATER  ,NEWGROUNDWATER  ,NEWUNDERGROUNDWATER  ,OTHERWATER  ,OTHERENTERWATER  ,"+
				"REUSEDWATER  ,RENEWWATER ,OWNWATER,DATASOURCE  ,UPDATETIME";
		
		String[] array = s.split(",");
		
		for(int i=0;i<array.length;i++){
			array[i] = "#{"+array[i]+","+"jdbcType=VARCHAR}";
		}
		System.out.println(Arrays.asList(array));
	}
	@Test
	public void UPDATEsqlutil(){
		String s = "PKID,STANDENTERID ,ENTERID ,DATATYPE,YEAR ,QUARTER  ,MONTH  ,DAY ,TOTALUSEDWATER  ,WATERUNIT,"+
				"NEWWATER ,NEWTAPWATER  ,NEWGROUNDWATER  ,NEWUNDERGROUNDWATER  ,OTHERWATER  ,OTHERENTERWATER  ,"+
				"REUSEDWATER  ,RENEWWATER ,OWNWATER,DATASOURCE  ,UPDATETIME";
		
		String[] array = s.split(",");
		
		for(int i=0;i<array.length;i++){
			array[i] = array[i]+"="+"#{"+array[i]+","+"jdbcType=VARCHAR}";
		}
		System.out.println(Arrays.asList(array));
	}
}
