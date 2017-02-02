package com.yuen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yuen.domain.Cart;
import com.yuen.domain.Item;
import com.yuen.domain.Product;
import com.yuen.service.CartService;
import com.yuen.service.ProductService;

@Controller
@Scope("session")
public class CartController {
	
	@Autowired
	private Cart cart;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("/cart")
	public String view(RedirectAttributes redirect) {
		if (cart == null || cart.getCount() == 0) {
			redirect.addFlashAttribute("error", "Your cart is empty");
			return "redirect:/";
		} else {
			return "cart";
		}
	}
	
	@GetMapping("/cart/add")
	public String add(@RequestParam("id") int id) {
		Product product = productService.findOne(id);
		if (product == null) {
			return "404";
		} else {
			cartService.add(new Item(product, 1));
			return "redirect:/cart";
		}
	}
	
	@GetMapping("/cart/update")
	public String update(@RequestParam("id") int id, @RequestParam("quantity") int quantity, 
			RedirectAttributes redirect) {
		if (cart.getCount() == 0) {
			redirect.addFlashAttribute("error", "Your cart is empty");
			return "redirect:/";
		} else {
			Product product = productService.findOne(id);
			if (product == null) { 
				return "404";
			} else {
				cartService.update(new Item(product, quantity));
				return "redirect:/cart";
			}
		}
	}
	
	@GetMapping("/cart/remove")
	public String remove(@RequestParam("id") int id, RedirectAttributes redirect) {
		if (cart.getCount() == 0) {
			redirect.addFlashAttribute("error", "Your cart is empty");
			return "redirect:/";
		} else {
			Product product = productService.findOne(id);
			if (product == null) { 
				return "404";
			} else {
				cartService.remove(product.getId());
				return "redirect:/cart";
			}
		}
	}
	
	
}
