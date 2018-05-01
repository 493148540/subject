package com.zm.platform.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zm.platform.domain.Info;
import com.zm.platform.domain.User;
import com.zm.platform.util.FileUpload;

@Controller

public class FileHandler {
	
	
	@RequestMapping("uploadfile")
	@ResponseBody
	public Info testfile(@RequestParam("file")MultipartFile file,HttpServletRequest request) throws Exception{
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			return new Info("该操作需要登录","上传失败,该操作需要登录",200);
		}
		String filename = System.currentTimeMillis()/1000+"_"+user.getUserName()+"_"+file.getOriginalFilename();
		String fileabspath = FileUpload.writefile(file, request.getSession().getServletContext().getRealPath("/upload/files"), filename);
		String filerealpath = request.getContextPath()+"/"+"upload/files"+"/"+fileabspath;
		return new Info(filerealpath,"上传成功",200);
	}
}
