package com.yuen.domain;

import java.io.Serializable;
import java.util.ArrayList;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("session")
public class Cart implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private ArrayList<Item> items;

	public Cart() {
        items = new ArrayList<>();
    }
	
	public void setItems(ArrayList<Item> items) {
		this.items = items;
	}

	public ArrayList<Item> getItems() {
		return items;
	}

	public int getCount() {
		return items.size();
	}
	
	public int getTotal() {
		int total = 0;
		for (Item e : items) {
			total += e.getSubTotal();
		}
		return total;
	}
	
}