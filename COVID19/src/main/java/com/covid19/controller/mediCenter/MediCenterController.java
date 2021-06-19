package com.covid19.controller.mediCenter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MediCenterController {


	@RequestMapping("/MediCenterSearch.do")
	public String mediCenterSearch() {

		return "mediCenter/mediCenterSearch";
	}
}
