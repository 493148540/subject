package com.zm.platform.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	public static String writefile(MultipartFile file,String path) throws Exception{
		if(file.getOriginalFilename()==null||file.getOriginalFilename()==""){
			return "";
		}
	
		InputStream in = file.getInputStream();
		File files = new File(path);
		System.out.println(path);
		if(!files.exists())
			files.mkdirs();
		String filename =java.util.UUID.randomUUID().toString().replaceAll("-", "")+"."+getFileType(file.getOriginalFilename());
		System.out.println(filename);
		File img = new File(files,filename);
		System.out.println(getFileType(file.getOriginalFilename()));
		if(!img.exists())
			img.createNewFile();
		FileOutputStream out = new FileOutputStream(img);
		byte[] b = new byte[1024];
		int len;
		while((len=in.read(b))!=-1){
			out.write(b,0,len);
		}
		in.close();
		out.close();
		return filename;
	}
	//自定义名字
	public static String writefile(MultipartFile file,String path,String filename) throws Exception{
		if(file.getOriginalFilename()==null||file.getOriginalFilename()==""){
			return "";
		}
	
		InputStream in = file.getInputStream();
		File files = new File(path);
		System.out.println(path);
		if(!files.exists())
			files.mkdirs();
		System.out.println(filename);
		File img = new File(files,filename);
		System.out.println(getFileType(file.getOriginalFilename()));
		if(!img.exists())
			img.createNewFile();
		FileOutputStream out = new FileOutputStream(img);
		byte[] b = new byte[1024];
		int len;
		while((len=in.read(b))!=-1){
			out.write(b,0,len);
		}
		in.close();
		out.close();
		return filename;
	}
	public static String writefile(InputStream in,String path,String type) throws Exception{
		File files = new File(path);
		System.out.println(path);
		if(!files.exists())
			files.mkdirs();
		String filename =java.util.UUID.randomUUID().toString().replaceAll("-", "")+"."+type;
		System.out.println(filename);
		File file = new File(files,filename);
		if(!file.exists())
			file.createNewFile();
		FileOutputStream out = new FileOutputStream(file);
		byte[] b = new byte[1024];
		int len;
		while((len=in.read(b))!=-1){
			out.write(b,0,len);
		}
		in.close();
		out.close();
		return filename;
	}
	
	
	public static void testToOne(){
		File file = new File("/BLW/upload/image");
		System.out.println(file);
	}
	
	
	public static String getFileType(String name){
		String[] str = name.split("\\.");
		return str[str.length-1];
	}
	
	public String setFileName(String sessionid){
		int ran1 = getRanNumber(0,5);
		int ran2 = getRanNumber(5,10);
		int ran3 = getRanNumber(10,15);
		int ran4 = getRanNumber(15,20);
		int ran5 = getRanNumber(20,25);
		String str = sessionid.substring(ran1, ran1+5)+sessionid.substring(ran2, ran2+5)+sessionid.substring(ran3, ran3+5)+sessionid.substring(ran4, ran4+5)+sessionid.substring(ran5, ran5+5);
		String date = new Date().getTime()+"";
		return str+date;
	}
	
	public int getRanNumber(int min,int max) {
        Random random = new Random();

        return random.nextInt(max)%(max-min+1) + min;
    }
}
