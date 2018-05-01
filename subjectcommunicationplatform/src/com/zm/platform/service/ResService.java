package com.zm.platform.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.zm.platform.dao.ResDao;
import com.zm.platform.domain.DownLoadRecord;
import com.zm.platform.domain.Info;
import com.zm.platform.domain.Res;
import com.zm.platform.domain.User;
import com.zm.platform.util.FileUpload;
@Service
public class ResService extends BaseService<Res>{
	@Autowired
	private UserService userService;
	@Autowired
	private DownLoadRecordService downLoadRecordService;
	@Autowired
	private ResDao resDao;
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
	
	public  void download(Res res,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		String filename = res.getResName()+"."+res.getResIcon();
		String filepath = 	res.getResUrl();
		
		File file = new File(request.getSession().getServletContext().getRealPath(filepath));
		InputStream in =null;
		try{
			in = new FileInputStream(file);
		}catch(FileNotFoundException e){
			
		}
		
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
	/**
	 * 下载成功后改变积分
	 */
	@Transactional
	public void doChangePoint(Res res, User user) {
		// TODO Auto-generated method stub
		try{
			res.setResDownloadCount(res.getResDownloadCount()+1);
			User resuser = userService.findById(res.getResUserId());
			if(user.getUserId()==resuser.getUserId())
				return;
			
			resuser.setUserResPoint(resuser.getUserResPoint()+res.getResPoint());
			user.setUserResPoint(user.getUserResPoint()-res.getResPoint());
			
			resDao.update(res);
			userService.update(resuser);
			userService.update(user);
			downLoadRecordService.insert(new DownLoadRecord(null, res.getResId(), user.getUserId()));
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
