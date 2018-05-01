package com.zm.platform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zm.platform.domain.TopicType;
import com.zm.platform.querydomain.QueryTopicType;

@Controller
@RequestMapping("topictypemanage")
public class TopicTypeHandler extends BaseHandler<TopicType,QueryTopicType>{

}
