package com.yuen.dao;

import com.yuen.domain.User;

public interface UserDAO {
	
	User findOne(String email);
	
	void create(User user);
	
}
