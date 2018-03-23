package com.zm.platform.util;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Iterator;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.FileImageInputStream;
import javax.imageio.stream.ImageInputStream;

import org.springframework.web.multipart.MultipartFile; 

public class OperateImage { 
	private String srcpath;
	private String subpath;
	private	int x ;
	private	int y ;
	private	int width ;

	private	 int height ;
	
	public OperateImage() {
	}
	public OperateImage( int x, int y, int width, int height){
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}
	
		/**	  
	    * 对图片裁剪，并把裁剪完蛋新图片保存 。 
	  
		 * @return */
	public String cut(MultipartFile file,String path)throws Exception {
		System.out.println(file.getOriginalFilename()==null||file.getOriginalFilename()=="");
		if(file.getOriginalFilename()==null||file.getOriginalFilename()==""){
			return "";
		}
	//	FileInputStream is =null ;
		ImageInputStream iis = null ;
		InputStream in=null;
		try { 
		//读取图片文件
		//is =new FileInputStream(srcpath);
		
			in =  file.getInputStream();
		
		
		String [] strs = file.getOriginalFilename().split("\\.");
		System.out.println(strs[strs.length-1]);
		Iterator < ImageReader > it=ImageIO.getImageReadersByFormatName(strs[strs.length-1]);
		ImageReader reader = it.next();
		iis = ImageIO.createImageInputStream(in);
		reader.setInput(iis, true ) ;
		ImageReadParam param = reader.getDefaultReadParam();
		Rectangle rect =new Rectangle(x, y, width, height);
		param.setSourceRegion(rect);
		BufferedImage bi=reader.read(0,param);
		 
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		StringBuffer filename= new StringBuffer();
		filename.append(path);
		filename.append("/");
		filename.append(uuid);
		filename.append(".");
		filename.append(strs[strs.length-1]);
		System.out.println(filename);
		ImageIO.write(bi,strs[strs.length-1],new File(filename.toString()));
		
		//ImgCompress imgCom = new ImgCompress(filename.toString(),filename.toString());  
      //  imgCom.resizeFix(240, 160);  
		return uuid+"."+strs[strs.length-1];
		}finally {
			
			if (iis != null )
				iis.close();
		}
	}
	
	/**	  
	    * 对图片裁剪，并把裁剪完蛋新图片保存 。 
	  
		 * @return */
	public String cut(String path)throws Exception {

	//	FileInputStream is =null ;
		ImageInputStream iis = null ;

		try { 
		//读取图片文件
		//is =new FileInputStream(srcpath);
		
		FileInputStream in = new FileInputStream(srcpath);
		String [] strs = srcpath.split("\\.");
		System.out.println(strs[strs.length-1]);
		
		Iterator < ImageReader > it=ImageIO.getImageReadersByFormatName(strs[strs.length-1]);
		ImageReader reader = it.next();
		iis = ImageIO.createImageInputStream(in);
		reader.setInput(iis, true ) ;
		ImageReadParam param = reader.getDefaultReadParam();
		Rectangle rect =new Rectangle(x, y, width, height);
		param.setSourceRegion(rect);
		BufferedImage bi=reader.read(0,param);
		
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		StringBuffer filename= new StringBuffer();
		filename.append(path);
		filename.append("/");
		filename.append(uuid);
		filename.append(".");
		filename.append(strs[strs.length-1]);
		System.out.println(filename);
		ImageIO.write(bi,strs[strs.length-1],new File(filename.toString()));
	//	ImgCompress imgCom = new ImgCompress(filename.toString(),filename.toString());  
      //  imgCom.resizeFix(1075, 1500);  
		return uuid+"."+strs[strs.length-1];
		}finally {
			
			if (iis != null )
				iis.close();
		}
	}
	public	int getHeight() {
		return height;
		}

	public	void setHeight( int height) {
		this .height = height;
	}
	public String getSrcpath() {
		return srcpath;
	}

	public	void setSrcpath(String srcpath) {
		this .srcpath = srcpath;
	}	
	public String getSubpath() {
		return subpath;
		}
	public	void setSubpath(String subpath) {
		this.subpath =subpath;
		}
	public	int getWidth() {
		return width;
}
	public	void setWidth( int width) {
		this .width = width;
	}
	public	int getX() {
		return x;
	}
	public	void setX( int x){
		this .x = x;
	}

	public	int getY(){
		return y;
	}
	public	void setY( int y) {
		this .y = y;
	}
	
}