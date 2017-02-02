package com.yuen.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yuen.domain.Order;
import com.yuen.service.CheckoutService;

@Controller
@Scope("session")
public class CheckoutController {
	
	@Autowired
	private CheckoutService checkoutService;
	
	@GetMapping("/checkout")
	public String getCheckout(Model model) {
		model.addAttribute("order", new Order());
		return "checkout";
	}
	
	@PostMapping("/checkout")
	public String postCheckout(@Valid Order order, BindingResult result, RedirectAttributes redirect) {
		if (result.hasErrors()) {
			return "checkout";
		} 
		
		checkoutService.create(order);
		redirect.addFlashAttribute("success", "Order successfully! We will contact you as soon as possible.");
		return "redirect:/";
	}
	
}
