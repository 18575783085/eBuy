package com.ishopmall.service;

import java.util.List;

import com.ishopmall.model.UserComment;

public interface UserCommentService {

	public List<UserComment> findAll(String userId);
}
