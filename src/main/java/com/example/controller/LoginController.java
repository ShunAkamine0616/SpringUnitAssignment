package com.example.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.controller.form.LoginForm;
import com.example.entity.Category;
import com.example.entity.Product;
import com.example.entity.User;
import com.example.service.CategoryService;
import com.example.service.ProductService;
import com.example.service.UserService;

@Controller
public class LoginController {
	@Autowired
	HttpSession session;
	@Autowired
	UserService userService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	MessageSource messageSource;
	@Autowired
	ProductService productService;
	
	@RequestMapping("/index")
	public String index(@ModelAttribute("index") LoginForm loginform, Model model) {
		System.out.println("aaaaaaaa");
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String result(@Validated @ModelAttribute("index") LoginForm loginform, BindingResult bindingResult, Model model) {
		// 入力チェック
		if (bindingResult.hasErrors()) {
			return "index";
		}
		User user = userService.findByUserIdAndPass(loginform.getLoginId(), loginform.getPassword());
		// ログイン失敗
		if(user == null) {
			String errMsg = messageSource.getMessage("login.error", null, Locale.getDefault());
			model.addAttribute("loginErrMsg", errMsg);
			return "index";
		} else {
			List<Product> productList = productService.findAll("product_id");
			List<Category> categoryList = categoryService.find();
			session.setAttribute("productList", productList);
			session.setAttribute("categoryList", categoryList);
			session.setAttribute("user", user);
			return "menu";
		}
	}
	
	@RequestMapping("back")
	public String index(Model model) {
		System.out.println("aaaaaaaa");
		return "menu";
	}
}
