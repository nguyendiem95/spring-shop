package com.yuen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.yuen.domain.Category;
import com.yuen.domain.Product;
import com.yuen.service.CategoryService;
import com.yuen.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("products", productService.findAll(9));
		return "index";
	}
	
	@GetMapping("/category/{id}")
	public String category(@PathVariable("id") int id, Model model) {
		Category category = categoryService.findOne(id);
		if (category == null) {
			return "404";
		} else {
			model.addAttribute("categories", categoryService.findAll());
			model.addAttribute("products", category.getProducts());
			return "category";
		}
	}
	
	@GetMapping("/search")
	public String search(@RequestParam("q") String q, Model model) {
		model.addAttribute("products", productService.search(q));
		return "search";
	}
	
	@GetMapping("/product/{id}")
	public String product(@PathVariable("id") int id, Model model) {
		Product product = productService.findOne(id);
		if (product == null) {
			return "404";
		} else {
			model.addAttribute("categories", categoryService.findAll());
			model.addAttribute("product", product);
			return "product";
		}
	}
	
}
