package com.yuen.service;

import com.yuen.domain.Item;

public interface CartService {

	public void add(Item item);
	
	public void update(Item item);
	
	public void remove(int id);
	
}
