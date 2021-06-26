package com.covid19.controller.mediCenter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.covid19.model.mediCenter.MediCenterBean;
import com.covid19.model.mediCenter.MediCenterDao;

@Controller
public class MediCenterController {

	@Autowired
	MediCenterBean mediCenterBean;

	@Autowired
	MediCenterDao mediCenterDao;

	@RequestMapping("/MediCenterSearch.do")
	public String mediCenterSearch() {

		return "mediCenter/mediCenterSearch";
	}

	@RequestMapping("/MediCenterVaccSearch.do")
	public String mediCenterVaccSearch() {
		
		return "mediCenter/mediCenterVaccSearch";
	}


	@RequestMapping(value = "/ShowCenter.do", produces = "application/json;charset=UTF-8;")
	@ResponseBody
	public List<MediCenterBean> showAllCenter(int gubun, String sido, String sigungu, String roadName) {
		List<MediCenterBean> mediCenterList = mediCenterDao.showCenter(gubun, sido, sigungu, roadName);
		return mediCenterList;
	}

	@RequestMapping(value = "/ShowCenterWithVacc.do", produces = "application/json;charset=UTF-8;")
	@ResponseBody
	public List<MediCenterBean> showCenterWithVacc(int gubun, String sido, String sigungu, String roadName) {
		List<MediCenterBean> mediCenterList = mediCenterDao.showCenterWithVacc(gubun, sido, sigungu, roadName);
		return mediCenterList;
	}
	
	

}
