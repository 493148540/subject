package com.zm.platform.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.zm.platform.domain.Subject;
import com.zm.platform.querydomain.QuerySubject;

public interface SubjectDao extends Dao<Subject>{
	
	@Select(value = " select subjecttype,subjectcode,group_concat(CONCAT(subjectid,':',subjectname)  Separator  ';') as subjectcodename "+ 
			" from `subject` "+
			" group by subjectcode; ")
	public 	List<QuerySubject> getSubjectsMenu();
}
