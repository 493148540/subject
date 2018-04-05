package com.zm.platform.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.zm.platform.domain.TopicType;

public interface TopicTypeDao extends Dao<TopicType>{

	@Select("select * from TopicType where topictypesubjectid=#{topictypesubjectid}")
	List<TopicType> findBySubjectid(Long topictypesubjectid);

}
