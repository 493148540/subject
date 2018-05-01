package com.zm.platform.domain;

import java.security.NoSuchAlgorithmException;

import com.zm.platform.util.MD5;

public class User {
	private Long userId;
	private String userName;
	private String userPassword;
	private int userRoleId;
	private String userEmail;
	private String userHead;
	private int userResPoint;
	
	
	public User(Long userId, String userName, String userPassword, int userRoleId, String userEmail, String userHead,
			int userResPoint) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userRoleId = userRoleId;
		this.userEmail = userEmail;
		this.userHead = userHead;
		this.userResPoint = userResPoint;
	}
	public int getUserResPoint() {
		return userResPoint;
	}
	public void setUserResPoint(int userResPoint) {
		this.userResPoint = userResPoint;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(Long userId, String userName, String userPassword, int userRoleId, String userEmail, String userHead) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userRoleId = userRoleId;
		this.userEmail = userEmail;
		this.userHead = userHead;
	}
	public String getUserHead() {
		return userHead;
	}
	public void setUserHead(String userHead) {
		this.userHead = userHead;
	}
	public void setMD5Password() throws NoSuchAlgorithmException {
			userPassword = MD5.MD5_32bit(userPassword);	
	}
	public String getMD5Password() throws NoSuchAlgorithmException{
		return MD5.MD5_32bit1(userPassword);	
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getUserRoleId() {
		return userRoleId;
	}
	public void setUserRoleId(int userRoleId) {
		this.userRoleId = userRoleId;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPassword=" + userPassword + ", userRoleId="
				+ userRoleId + ", userEmail=" + userEmail + ", userHead=" + userHead + ", userResPoint=" + userResPoint
				+ "]";
	}
	
	
	
}
