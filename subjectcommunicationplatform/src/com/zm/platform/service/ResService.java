package com.zm.platform.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.zm.platform.domain.Info;
import com.zm.platform.domain.Res;
import com.zm.platform.domain.User;
import com.zm.platform.util.FileUpload;
@Service
public class ResService extends BaseService<Res>{
	
	public Info savefile(MultipartFile file,HttpServletRequest request) throws Exception{
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			return new Info("该操作需要登录","上传失败,该操作需要登录",200);
		}
		String filename = System.currentTimeMillis()/1000+"_"+user.getUserName()+"_"+file.getOriginalFilename();
		String fileabspath = FileUpload.writefile(file, request.getSession().getServletContext().getRealPath("/upload/files"), filename);
		String filerealpath = "upload/files"+"/"+fileabspath;
		return new Info(filerealpath,"上传成功",200);
	}
}
