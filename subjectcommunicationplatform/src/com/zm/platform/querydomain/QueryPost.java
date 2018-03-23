package com.zm.platform.querydomain;

public class QueryPost extends QueryPage{
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
	
	private String postLastreplyName;
	
	private Long postParentId;// 父节点id
	private Long postSubjectId;//学科id
	private int  postFloorid;	//楼号
	
	private Long userId;
	private String userName;
	
	private int userRoleId;
	private String userEmail;
	private String userHead;
	
	private Long topicTypeId;
	private String topicTypeName;
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
	public void setPostLastreplyTime(String postLastreplyTime) {
		this.postLastreplyTime = postLastreplyTime;
	}
	public String getPostLastreplyName() {
		return postLastreplyName;
	}
	public void setPostLastreplyName(String postLastreplyName) {
		this.postLastreplyName = postLastreplyName;
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
	public String getUserHead() {
		return userHead;
	}
	public void setUserHead(String userHead) {
		this.userHead = userHead;
	}
	public Long getTopicTypeId() {
		return topicTypeId;
	}
	public void setTopicTypeId(Long topicTypeId) {
		this.topicTypeId = topicTypeId;
	}
	public String getTopicTypeName() {
		return topicTypeName;
	}
	public void setTopicTypeName(String topicTypeName) {
		this.topicTypeName = topicTypeName;
	}
	@Override
	public String toString() {
		return "QueryPost [postId=" + postId + ", postName=" + postName + ", postTopicTypeId=" + postTopicTypeId
				+ ", postContent=" + postContent + ", postTime=" + postTime + ", postUserId=" + postUserId
				+ ", postReplyNum=" + postReplyNum + ", postLookedNum=" + postLookedNum + ", postLastreply="
				+ postLastreply + ", postLastreplyTime=" + postLastreplyTime + ", postLastreplyName="
				+ postLastreplyName + ", postParentId=" + postParentId + ", postSubjectId=" + postSubjectId
				+ ", postFloorid=" + postFloorid + ", userId=" + userId + ", userName=" + userName + ", userRoleId="
				+ userRoleId + ", userEmail=" + userEmail + ", userHead=" + userHead + ", topicTypeId=" + topicTypeId
				+ ", topicTypeName=" + topicTypeName + "]";
	}
	public QueryPost(int page, int rows, String order, String sort, Long postId, String postName, Long postTopicTypeId,
			String postContent, String postTime, Long postUserId, int postReplyNum, int postLookedNum,
			Long postLastreply, String postLastreplyTime, String postLastreplyName, Long postParentId, Long postSubjectId,
			int postFloorid, Long userId, String userName, int userRoleId, String userEmail, String userHead,
			Long topicTypeId, String topicTypeName) {
		super(page, rows, order, sort);
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
		this.postLastreplyName = postLastreplyName;
		this.postParentId = postParentId;
		this.postSubjectId = postSubjectId;
		this.postFloorid = postFloorid;
		this.userId = userId;
		this.userName = userName;
		this.userRoleId = userRoleId;
		this.userEmail = userEmail;
		this.userHead = userHead;
		this.topicTypeId = topicTypeId;
		this.topicTypeName = topicTypeName;
	}
	public QueryPost() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QueryPost(int page, int rows, String order, String sort) {
		super(page, rows, order, sort);
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
}	
