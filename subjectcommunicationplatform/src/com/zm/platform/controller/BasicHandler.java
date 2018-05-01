package com.zm.platform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("basic")
@Controller
public class BasicHandler {
	
	@RequestMapping(value="subjectmanage")
	public ModelAndView subjectmanage(){
		return new ModelAndView("basic/subjectmanage/index");
	}
	
	@RequestMapping(value="usermanage")
	public ModelAndView usermanage(){
		return new ModelAndView("basic/usermanage/index");
	}
	
	@RequestMapping(value="topictypemanage")
	public ModelAndView topictypemanage(){
		return new ModelAndView("basic/topictypemanage/index");
	}
	
	@RequestMapping(value="resmanage")
	public ModelAndView resmanage(){
		return new ModelAndView("basic/resmanage/index");
	}
	
	@RequestMapping(value="postmanage")
	public ModelAndView postmanage(){
		return new ModelAndView("basic/postmanage/index");
	}
	
	@RequestMapping(value="dictionariesmanage")
	public ModelAndView dictionariesmanage(){
		return new ModelAndView("basic/dictionariesmanage/index");
	}
	
	@RequestMapping(value="index")
	public ModelAndView index(){
		return new ModelAndView("basic/index");
	}
	
}
