package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.controller.form.LoginForm;

@Controller
public class LogoutController {
	@RequestMapping("/logout")
	public String index(@ModelAttribute("index") LoginForm loginform, Model model) {
		
		return "index";
	}
}
