package com.zm.platform.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zm.platform.dao.SubjectDao;
import com.zm.platform.domain.Subject;
import com.zm.platform.querydomain.QuerySubject;

@Service
public class SubjectService extends BaseService<Subject>{
	@Autowired
	private SubjectDao subjectdao;
	
	
	public  List<QuerySubject>  getSubjectsMenu(){
		return subjectdao.getSubjectsMenu();
	}
}
