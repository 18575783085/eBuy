package com.ishopmall.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishopmall.dao.UserCommentDao;
import com.ishopmall.model.UserComment;
import com.ishopmall.service.UserCommentService;
@Service
public class UserCommentServiceImpl implements UserCommentService{
	@Autowired
	private UserCommentDao userCommentDao;
	@Override
	public List<UserComment> findAll(String userId) {
		return userCommentDao.findAll(userId);
	}
}
