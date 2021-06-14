package com.covid19.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = {"/", "/Index.do"}, method = RequestMethod.GET)
	public String Home() {
		return "index";
	}
}
