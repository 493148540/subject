package com.zm.platform.domain;

public class DownLoadRecord {
	private Long downLoadRecordId;
	private Long resId;
	private Long userId;
	public Long getDownLoadRecordId() {
		return downLoadRecordId;
	}
	public void setDownLoadRecordId(Long downLoadRecordId) {
		this.downLoadRecordId = downLoadRecordId;
	}
	public Long getResId() {
		return resId;
	}
	public void setResId(Long resId) {
		this.resId = resId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "DownLoadRecord [downLoadRecordId=" + downLoadRecordId + ", resId=" + resId + ", userId=" + userId + "]";
	}
	public DownLoadRecord() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DownLoadRecord(Long downLoadRecordId, Long resId, Long userId) {
		super();
		this.downLoadRecordId = downLoadRecordId;
		this.resId = resId;
		this.userId = userId;
	}
	
	
}
