package com.yuen.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.yuen.dao.ItemDAO;
import com.yuen.dao.OrderDAO;
import com.yuen.dao.UserDAO;
import com.yuen.domain.Cart;
import com.yuen.domain.Item;
import com.yuen.domain.Order;

@Service
@Scope("session")
public class CheckoutServiceImpl implements CheckoutService {

	@Autowired
	private Cart cart;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private ItemDAO itemDAO;
	
	@Override
	public void create(Order order) {
		// Save order
		order.setCreatedAt(new Date());
		
		String email;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
		    email = ((UserDetails) principal).getUsername();
		} else {
		    email = principal.toString();
		}
		order.setUser(userDAO.findOne(email));
		
		orderDAO.create(order);
		
		// Save items 
		ArrayList<Item> items = cart.getItems();
		for (Item item : items) {
			item.setPrice(item.getProduct().getPrice());
			item.setOrder(order);
			itemDAO.create(item);
		}
	}

}
