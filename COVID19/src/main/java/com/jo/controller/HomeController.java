package com.jo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	// 들어온 요청이 / 로 시작한다면 아래 함수 실행
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String Home() {
		return "index";
	}
}
