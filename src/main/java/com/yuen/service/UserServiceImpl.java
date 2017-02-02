package com.yuen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.yuen.dao.UserDAO;
import com.yuen.domain.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public User findOne(String email) {
		return userDAO.findOne(email);
	}

	@Override
	public void create(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		userDAO.create(user);
	}

}
