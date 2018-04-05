package com.zm.platform.domain;

public class Post {
	private Long postId;		//id
	private String postName;	//标题
	private Long postTopicTypeId;//话题类型
	private String postContent;//内容
	private String postTime;	//发帖时间
	private Long postUserId;	//发帖人
	private int postReplyNum; //回复数
	private int postLookedNum; //查看数量
	private Long postLastreply; //最后回复
	private String postLastreplyTime; //最后回复时间 
	
	private Long postParentId;// 父节点id
	private Long postSubjectId;//学科id
	private int  postFloorid;	//楼号
	public Long getPostId() {
		return postId;
	}
	public void setPostId(Long postId) {
		this.postId = postId;
	}
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public Long getPostTopicTypeId() {
		return postTopicTypeId;
	}
	public void setPostTopicTypeId(Long postTopicTypeId) {
		this.postTopicTypeId = postTopicTypeId;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostTime() {
		return postTime;
	}
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
	public Long getPostUserId() {
		return postUserId;
	}
	public void setPostUserId(Long postUserId) {
		this.postUserId = postUserId;
	}
	public int getPostReplyNum() {
		return postReplyNum;
	}
	public void setPostReplyNum(int postReplyNum) {
		this.postReplyNum = postReplyNum;
	}
	public int getPostLookedNum() {
		return postLookedNum;
	}
	public void setPostLookedNum(int postLookedNum) {
		this.postLookedNum = postLookedNum;
	}
	public Long getPostLastreply() {
		return postLastreply;
	}
	public void setPostLastreply(Long postLastreply) {
		this.postLastreply = postLastreply;
	}
	public String getPostLastreplyTime() {
		return postLastreplyTime;
	}
	public void setPostLastreplyTime(String string) {
		this.postLastreplyTime = string;
	}
	public Long getPostParentId() {
		return postParentId;
	}
	public void setPostParentId(Long postParentId) {
		this.postParentId = postParentId;
	}
	public Long getPostSubjectId() {
		return postSubjectId;
	}
	public void setPostSubjectId(Long postSubjectId) {
		this.postSubjectId = postSubjectId;
	}
	public int getPostFloorid() {
		return postFloorid;
	}
	public void setPostFloorid(int postFloorid) {
		this.postFloorid = postFloorid;
	}
	public Post(Long postId, String postName, Long postTopicTypeId, String postContent, String postTime,
			Long postUserId, int postReplyNum, int postLookedNum, Long postLastreply, String postLastreplyTime,
			Long postParentId, Long postSubjectId, int postFloorid) {
		super();
		this.postId = postId;
		this.postName = postName;
		this.postTopicTypeId = postTopicTypeId;
		this.postContent = postContent;
		this.postTime = postTime;
		this.postUserId = postUserId;
		this.postReplyNum = postReplyNum;
		this.postLookedNum = postLookedNum;
		this.postLastreply = postLastreply;
		this.postLastreplyTime = postLastreplyTime;
		this.postParentId = postParentId;
		this.postSubjectId = postSubjectId;
		this.postFloorid = postFloorid;
	}
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Post [postId=" + postId + ", postName=" + postName + ", postTopicTypeId=" + postTopicTypeId
				+ ", postContent=" + postContent + ", postTime=" + postTime + ", postUserId=" + postUserId
				+ ", postReplyNum=" + postReplyNum + ", postLookedNum=" + postLookedNum + ", postLastreply="
				+ postLastreply + ", postLastreplyTime=" + postLastreplyTime + ", postParentId=" + postParentId
				+ ", postSubjectId=" + postSubjectId + ", postFloorid=" + postFloorid + "]";
	}
	
	
	
	
	

}
