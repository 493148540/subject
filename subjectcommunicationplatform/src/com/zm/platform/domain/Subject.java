package com.zm.platform.domain;

public class Subject {
	private Long subjectId;
	private String subjectName;
	private String subjectType;
	private String subjectCode;
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
		return "Subject [subjectId=" + subjectId + ", subjectName=" + subjectName + ", subjectType=" + subjectType
				+ ", subjectCode=" + subjectCode + "]";
	}
	public Subject(Long subjectId, String subjectName, String subjectType, String subjectCode) {
		super();
		this.subjectId = subjectId;
		this.subjectName = subjectName;
		this.subjectType = subjectType;
		this.subjectCode = subjectCode;
	}
	public Subject() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
