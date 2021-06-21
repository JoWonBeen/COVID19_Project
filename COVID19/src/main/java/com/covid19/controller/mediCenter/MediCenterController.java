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

	@RequestMapping(value = "/ShowAllCenter.do", produces = "application/json;charset=UTF-8;")
	@ResponseBody
	public List<MediCenterBean> showAllCenter(String sido, String sigungu) {
		List<MediCenterBean> mediCenterList = mediCenterDao.showAllCenter(sido, sigungu);
		return mediCenterList;
	}

	@RequestMapping(value = "/ShowClassifiedCenter.do", produces = "application/json;charset=UTF-8;")
	@ResponseBody
	public List<MediCenterBean> showClassifiedCenter(int gubun, String sido, String sigungu) {
		List<MediCenterBean> mediCenterList = mediCenterDao.showClassifiedCenter(gubun, sido, sigungu);
		return mediCenterList;
	}

}
