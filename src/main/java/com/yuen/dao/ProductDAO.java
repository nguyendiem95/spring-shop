package com.yuen.dao;

import java.util.List;

import com.yuen.domain.Product;

public interface ProductDAO {

	List<Product> findAll(int max);
	
	List<Product> search(String q);

	Product findOne(int id);

}
