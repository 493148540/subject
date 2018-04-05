package com.zm.platform.querydomain;

public class QueryRes extends QueryPage{
	
	private Long resId; //id
	private String resCode;	//编号
	private String resName;	//文件名
	private Long resUserId;	//上传人
	private String resUploadTime;	//上传时间
	private String resSize;	//大小
	private int resDownloadCount; //下载次数
	private Long resSubjectId;	//学科类别id
	private Long resTypeId;	//类型id
	private String resDescribe; //描述
	private String resTag; //关键词
	private int resPoint; //积分
	private String resUrl;
	private String resIcon;
	public Long getResId() {
		return resId;
	}
	public void setResId(Long resId) {
		this.resId = resId;
	}
	public String getResCode() {
		return resCode;
	}
	public void setResCode(String resCode) {
		this.resCode = resCode;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public Long getResUserId() {
		return resUserId;
	}
	public void setResUserId(Long resUserId) {
		this.resUserId = resUserId;
	}
	public String getResUploadTime() {
		return resUploadTime;
	}
	public void setResUploadTime(String resUploadTime) {
		this.resUploadTime = resUploadTime;
	}
	public String getResSize() {
		return resSize;
	}
	public void setResSize(String resSize) {
		this.resSize = resSize;
	}
	public int getResDownloadCount() {
		return resDownloadCount;
	}
	public void setResDownloadCount(int resDownloadCount) {
		this.resDownloadCount = resDownloadCount;
	}
	public Long getResSubjectId() {
		return resSubjectId;
	}
	public void setResSubjectId(Long resSubjectId) {
		this.resSubjectId = resSubjectId;
	}
	public Long getResTypeId() {
		return resTypeId;
	}
	public void setResTypeId(Long resTypeId) {
		this.resTypeId = resTypeId;
	}
	public String getResDescribe() {
		return resDescribe;
	}
	public void setResDescribe(String resDescribe) {
		this.resDescribe = resDescribe;
	}
	public String getResTag() {
		return resTag;
	}
	public void setResTag(String resTag) {
		this.resTag = resTag;
	}
	public int getResPoint() {
		return resPoint;
	}
	public void setResPoint(int resPoint) {
		this.resPoint = resPoint;
	}
	public String getResUrl() {
		return resUrl;
	}
	public void setResUrl(String resUrl) {
		this.resUrl = resUrl;
	}
	public String getResIcon() {
		return resIcon;
	}
	public void setResIcon(String resIcon) {
		this.resIcon = resIcon;
	}
	@Override
	public String toString() {
		return "Res [resId=" + resId + ", resCode=" + resCode + ", resName=" + resName + ", resUserId=" + resUserId
				+ ", resUploadTime=" + resUploadTime + ", resSize=" + resSize + ", resDownloadCount=" + resDownloadCount
				+ ", resSubjectId=" + resSubjectId + ", resTypeId=" + resTypeId + ", resDescribe=" + resDescribe
				+ ", resTag=" + resTag + ", resPoint=" + resPoint + ", resUrl=" + resUrl + ", resIcon=" + resIcon + "]";
	}
	public QueryRes(Long resId, String resCode, String resName, Long resUserId, String resUploadTime, String resSize,
			int resDownloadCount, Long resSubjectId, Long resTypeId, String resDescribe, String resTag, int resPoint,
			String resUrl, String resIcon) {
		super();
		this.resId = resId;
		this.resCode = resCode;
		this.resName = resName;
		this.resUserId = resUserId;
		this.resUploadTime = resUploadTime;
		this.resSize = resSize;
		this.resDownloadCount = resDownloadCount;
		this.resSubjectId = resSubjectId;
		this.resTypeId = resTypeId;
		this.resDescribe = resDescribe;
		this.resTag = resTag;
		this.resPoint = resPoint;
		this.resUrl = resUrl;
		this.resIcon = resIcon;
	}
	public QueryRes() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
