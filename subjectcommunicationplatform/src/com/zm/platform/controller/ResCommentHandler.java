package com.zm.platform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zm.platform.domain.ResComment;
import com.zm.platform.querydomain.QueryResComment;

@Controller
@RequestMapping("rescommentmanage")
public class ResCommentHandler extends BaseHandler<ResComment,QueryResComment>{

}
