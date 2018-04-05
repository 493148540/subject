package com.zm.platform.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zm.platform.dao.TopicTypeDao;
import com.zm.platform.domain.TopicType;


@Service
public class TopicTypeService extends BaseService<TopicType>{

	@Autowired
	private TopicTypeDao topicTypeDao;
	public List<TopicType> findBySubjectid(long id) {
		// TODO Auto-generated method stub
		return topicTypeDao.findBySubjectid(id);
	}

}
