package com.yuen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuen.dao.ProductDAO;
import com.yuen.domain.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List<Product> findAll(int max) {
		return productDAO.findAll(max);
	}

	@Override
	public List<Product> search(String q) {
		return productDAO.search(q);
	}

	@Override
	public Product findOne(int id) {
		return productDAO.findOne(id);
	}

}
