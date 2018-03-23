package com.zm.platform.domain;

public class Info {
	private Object obj;
	private String message;
	private int statecode;
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getStatecode() {
		return statecode;
	}
	public void setStatecode(int statecode) {
		this.statecode = statecode;
	}
	@Override
	public String toString() {
		return "Info [obj=" + obj + ", message=" + message + ", statecode=" + statecode + "]";
	}
	public Info(Object obj, String message, int statecode) {
		super();
		this.obj = obj;
		this.message = message;
		this.statecode = statecode;
	}
	public Info() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
