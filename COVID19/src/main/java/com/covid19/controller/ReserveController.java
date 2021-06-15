package com.covid19.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReserveController {
	@GetMapping("/ReserveForm.do")
	public String reserveForm() {
		return "reserve/reserve_write";
	}
	@GetMapping("/Calendar.do")
	public String calendar() {
		return "reserve/calendar";
	}
}
