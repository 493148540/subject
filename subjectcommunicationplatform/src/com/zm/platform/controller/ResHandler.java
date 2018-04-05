package com.zm.platform.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zm.platform.domain.Res;
import com.zm.platform.querydomain.QueryRes;

@Controller
@RequestMapping("resmanage")
public class ResHandler extends BaseHandler<Res,QueryRes>{
	
}
