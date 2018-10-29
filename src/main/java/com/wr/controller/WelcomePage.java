package com.wr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class WelcomePage {
	@RequestMapping(value = "")
	public String welcome() {
		return "redirect: /wr/loginpage";
	}
}
