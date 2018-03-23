package com.zm.platform.domain;

public class TopicType {
	private Long topicTypeId;
	private String topicTypeName;
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
	
	public TopicType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TopicType(Long topicTypeId, String topicTypeName) {
		super();
		this.topicTypeId = topicTypeId;
		this.topicTypeName = topicTypeName;
	}
	@Override
	public String toString() {
		return "TopicType [topicTypeId=" + topicTypeId + ", topicTypeName=" + topicTypeName + "]";
	}
	
	
}
