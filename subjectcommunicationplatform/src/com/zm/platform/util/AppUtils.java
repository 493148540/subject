package com.zm.platform.util;

import java.beans.PropertyDescriptor;
import java.io.File;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


public class AppUtils {
	public static  long TokenOverdueTime; 
	
	public static long getTokenOverdueTime(){
		return TokenOverdueTime;
	}
	public  void setTokenOverdueTime(long TokenOverdueTime){
		this.TokenOverdueTime = TokenOverdueTime;
	}
	public AppUtils() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public static Object getWX_Result(Object bean,InputStream in) throws Exception{
		Element element = null;
		  // 可以使用绝对路劲
		  	Class clazz = (Class) bean.getClass(); 
			 System.out.println(clazz.getSimpleName());
			 Field[] fields = clazz.getDeclaredFields(); 
		//  File f = new File(path+"/"+"39e973b3e0d348068f80c91e43b6ad58.xml");
		  // documentBuilder为抽象不能直接实例化(将XML文件转换为DOM文件)
		  DocumentBuilder db = null;
		  DocumentBuilderFactory dbf = null;
		   // 返回documentBuilderFactory对象
		   dbf = DocumentBuilderFactory.newInstance();
		   // 返回db对象用documentBuilderFatory对象获得返回documentBuildr对象
			db = dbf.newDocumentBuilder();
		   // 得到一个DOM并返回给document对象
		   Document dt = null;
			dt = db.parse(in);
		   // 得到一个elment根元素
		   element = dt.getDocumentElement();
		   // 获得根节点
		   System.out.println("根元素：" + element.getNodeName());
		   // 获得根元素下的子节点
		   NodeList childNodes = element.getChildNodes();
		   // 遍历这些子节点
		   for (int i = 0; i < childNodes.getLength(); i++) {
		    // 获得每个对应位置i的结点
		    Node node1 = childNodes.item(i);
		    if("#text".equals(node1.getNodeName())==false){
				Field filed = clazz.getDeclaredField(node1.getNodeName());
				filed.setAccessible(true);
				PropertyDescriptor pd = new PropertyDescriptor(node1.getNodeName(),clazz);
				Method setMethod = pd.getWriteMethod();
				setMethod.invoke(bean,new Object[] { node1.getTextContent() });		
		    }  
		   }	 
		 return bean;
	}
	
	
}
