package com.yuen.service;

import com.yuen.domain.User;

public interface UserService {
	
	User findOne(String email);
	
	void create(User user);
	
}
