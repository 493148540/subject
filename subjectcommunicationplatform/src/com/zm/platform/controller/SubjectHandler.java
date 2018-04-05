package com.zm.platform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zm.platform.domain.Subject;
import com.zm.platform.querydomain.QuerySubject;

@Controller
@RequestMapping("subjectmanage")
public class SubjectHandler extends BaseHandler<Subject,QuerySubject>{
	
}
