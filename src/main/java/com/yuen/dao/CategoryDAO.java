package com.yuen.dao;

import java.util.List;

import com.yuen.domain.Category;

public interface CategoryDAO {

	List<Category> findAll();
	
	Category findOne(int id);
	
}
