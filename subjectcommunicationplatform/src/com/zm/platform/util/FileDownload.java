package com.zm.platform.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDownload {
	public static void download(String filename,String filepath,HttpServletRequest request,HttpServletResponse response) throws IOException{
		File file = new File(request.getSession().getServletContext().getRealPath(filepath));
		InputStream in = new FileInputStream(file);
		response.setContentType("application/octet-stream"); //设置mime头
		
		OutputStream out = response.getOutputStream();
		//InputStream in = request.getSession().getServletContext().getRealPath(filepath);
		
		 response.setHeader("Content-Disposition", "attachment;filename=\""
	                + new String(filename.getBytes(), "ISO8859-1") + "\"");
	            response.setContentLength((int) file.length());
		
		byte[] b = new byte[4096]; 
		int len;
		while((len=in.read(b))!=-1){
			out.write(b,0,len);
		}
		in.close();
		out.close();
	}
}
