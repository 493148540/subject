package com.zm.platform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zm.platform.domain.Dictionaries;
import com.zm.platform.querydomain.QueryDictionaries;

@Controller
@RequestMapping("dictionariesmanage")
public class DictionariesHandler extends BaseHandler<Dictionaries,QueryDictionaries>{

}
