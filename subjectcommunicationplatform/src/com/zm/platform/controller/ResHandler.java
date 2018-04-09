package com.zm.platform.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zm.platform.domain.Info;
import com.zm.platform.domain.Res;
import com.zm.platform.querydomain.QueryRes;
import com.zm.platform.service.ResService;

@Controller
@RequestMapping("resmanage")
public class ResHandler extends BaseHandler<Res,QueryRes>{
	
	@Autowired ResService resService;
	
	@ResponseBody
	@RequestMapping(value="insert",method=RequestMethod.POST)
	public Info add(Res res,
			HttpServletRequest request,@RequestParam("file")MultipartFile file) throws Exception{
			Info info = resService.savefile(file, request);
			if(info.getStatecode()!=200)
				return info;
			
			res.setResIcon(file.getOriginalFilename().replaceAll("^[\\S]*[\\.]", "").toLowerCase());
			res.setResUrl((String) info.getObj());
			try{
				return new Info(service.insert(res),"编辑成功",200);
			}catch(Exception e){
				return new Info(res,"编辑失败,系统抛出了异常:"+e,1);
			}
	
	}
}
