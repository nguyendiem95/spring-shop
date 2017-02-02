package com.yuen.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.yuen.domain.Cart;
import com.yuen.domain.Item;

@Service
@Scope("session")
public class CartServiceImpl implements CartService {
	
	private static final int LIMIT_ITEMS = 10;
	
	@Autowired
	private Cart cart;
	
	@Override
	public void add(Item item) {
		ArrayList<Item> items = cart.getItems();
		
		boolean exists = false;
		for (Item e : items) {
			if (e.getProduct().getId() == item.getProduct().getId()) {
				if (e.getQuantity() + item.getQuantity() <= LIMIT_ITEMS) {
					e.setQuantity(e.getQuantity() + item.getQuantity());
				} else {
					e.setQuantity(LIMIT_ITEMS);
				}
				exists = true;
				break;
			}
		}
		if (!exists) {
			items.add(item);
		}
		
		cart.setItems(items);
	}

	@Override
	public void update(Item item) {
		if (item.getQuantity() == 0) {
			remove(item.getProduct().getId());
		} else {
			ArrayList<Item> items = cart.getItems();
			
			for (Item e : items) {
				if (e.getProduct().getId() == item.getProduct().getId()) {
					if (item.getQuantity() <= LIMIT_ITEMS) {
						e.setQuantity(item.getQuantity());
					} else {
						e.setQuantity(LIMIT_ITEMS);
					}
					break;
				}
			}
			
			cart.setItems(items);
		}
	}

	@Override
	public void remove(int id) {
		ArrayList<Item> items = cart.getItems();

		for (Item e : items) {
			if (e.getProduct().getId() == id) {
				items.remove(e);
				break;
			}
		}
		
		cart.setItems(items);
	}

}
