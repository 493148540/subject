package com.zm.platform.querydomain;

public class QueryResComment extends QueryPage{
	private Long resCommentId; //id
	private Long resCommentParentId;	//父节点id
	private String resCommentContent;//评论内容
	private Long resCommentUserId;//评论人
	private String resCommentTime;//评论时间
	private double resCommentScore;//评价分数
	private String resCommentType;//评论类型
	public Long getResCommentId() {
		return resCommentId;
	}
	public void setResCommentId(Long resCommentId) {
		this.resCommentId = resCommentId;
	}
	public Long getResCommentParentId() {
		return resCommentParentId;
	}
	public void setResCommentParentId(Long resCommentParentId) {
		this.resCommentParentId = resCommentParentId;
	}
	public String getResCommentContent() {
		return resCommentContent;
	}
	public void setResCommentContent(String resCommentContent) {
		this.resCommentContent = resCommentContent;
	}
	public Long getResCommentUserId() {
		return resCommentUserId;
	}
	public void setResCommentUserId(Long resCommentUserId) {
		this.resCommentUserId = resCommentUserId;
	}
	public String getResCommentTime() {
		return resCommentTime;
	}
	public void setResCommentTime(String resCommentTime) {
		this.resCommentTime = resCommentTime;
	}
	public double getResCommentScore() {
		return resCommentScore;
	}
	public void setResCommentScore(double resCommentScore) {
		this.resCommentScore = resCommentScore;
	}
	public String getResCommentType() {
		return resCommentType;
	}
	public void setResCommentType(String resCommentType) {
		this.resCommentType = resCommentType;
	}
	@Override
	public String toString() {
		return "QueryResComment [resCommentId=" + resCommentId + ", resCommentParentId=" + resCommentParentId
				+ ", resCommentContent=" + resCommentContent + ", resCommentUserId=" + resCommentUserId
				+ ", resCommentTime=" + resCommentTime + ", resCommentScore=" + resCommentScore + ", resCommentType="
				+ resCommentType + "]";
	}
	public QueryResComment(Long resCommentId, Long resCommentParentId, String resCommentContent, Long resCommentUserId,
			String resCommentTime, double resCommentScore, String resCommentType) {
		super();
		this.resCommentId = resCommentId;
		this.resCommentParentId = resCommentParentId;
		this.resCommentContent = resCommentContent;
		this.resCommentUserId = resCommentUserId;
		this.resCommentTime = resCommentTime;
		this.resCommentScore = resCommentScore;
		this.resCommentType = resCommentType;
	}
	public QueryResComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
