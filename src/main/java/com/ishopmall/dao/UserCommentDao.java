package com.ishopmall.dao;

import java.util.List;


import com.ishopmall.model.UserComment;

public interface UserCommentDao {
	List<UserComment> findAll(String userId);
}
