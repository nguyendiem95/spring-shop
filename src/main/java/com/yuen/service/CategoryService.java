package com.yuen.service;

import java.util.List;

import com.yuen.domain.Category;

public interface CategoryService {

	List<Category> findAll();
	
	Category findOne(int id);
	
}
