package com.covid19.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@RequestMapping(value = "/MemberLogin.do", method = RequestMethod.GET)
	public String LogIn() {
		return "mainHome/VaccineHome";
	}
	@RequestMapping(value = "/CoronaConditionHome.do", method = RequestMethod.GET)
	public String CoronaConditionHome() {
		return "mainHome/CoronaConditionHome";
	}
}
