package com.yuen.service;

import java.util.List;

import com.yuen.domain.Product;

public interface ProductService {

	List<Product> findAll(int max);
	
	List<Product> search(String q);

	Product findOne(int id);
	
}
