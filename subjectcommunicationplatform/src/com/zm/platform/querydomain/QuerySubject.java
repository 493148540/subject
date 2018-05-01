package com.zm.platform.querydomain;

import java.util.ArrayList;
import java.util.List;

import com.zm.platform.domain.Subject;

public class QuerySubject extends QueryPage{
	private Long subjectId;
	private String subjectName;
	private String subjectType;
	private String subjectCode;
	
	//exam :    3:java;4:php;5:c++;6:c#;7:其他语言
	private String subjectcodename; 
	private List<Subject> subject;
	
	
	public List<Subject> getSubject() {
		return subject;
	}
	public void setSubject(List<Subject> subject) {
		this.subject = subject;
	}
	public String getSubjectcodename() {
		return subjectcodename;
	}
	public void setSubjectcodename(String subjectcodename) {
		this.subjectcodename = subjectcodename;
		toMap(subjectcodename);
	}
	public Long getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Long subjectId) {
		this.subjectId = subjectId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getSubjectType() {
		return subjectType;
	}
	public void setSubjectType(String subjectType) {
		this.subjectType = subjectType;
	}
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	
	@Override
	public String toString() {
		return "QuerySubject [subjectId=" + subjectId + ", subjectName=" + subjectName + ", subjectType=" + subjectType
				+ ", subjectCode=" + subjectCode + ", subjectcodename=" + subjectcodename + ", subject=" + subject
				+ "]";
	}
	public QuerySubject(Long subjectId, String subjectName, String subjectType, String subjectCode) {
		super();
		this.subjectId = subjectId;
		this.subjectName = subjectName;
		this.subjectType = subjectType;
		this.subjectCode = subjectCode;
	}
	public QuerySubject() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 
	 * @param str exam:   1:java;2:php->  [1:java,2:php]
	 */
	public void toMap(String str){
		System.out.println(str);
		subject = new ArrayList<Subject>();
		if(str != null && str !="")
		{
			String[] array = str.split(";");
			for(int i=0;i<array.length;i++){
				String[] keyvalue = array[i].split("\\:");
				Subject subject = new Subject();
				subject.setSubjectId(Long.parseLong(keyvalue[0]));
				subject.setSubjectName(keyvalue[1]);
				this.subject.add(subject);
			}
		}
	}
	
}
