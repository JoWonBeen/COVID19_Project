package com.covid19.controller.CenterAdmin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.covid19.model.CenterAdmin.CenterAdminDao;
import com.covid19.model.member.AdminBean;

@Controller
public class CenterReserveListController {
	
	@Autowired
	CenterAdminDao centerAdminDao;
	
	@Autowired
	AdminBean loggedMemberInfo;
	
	@RequestMapping(value="/CenterReserveList.do",produces="application/json;charset=UTF-8;")
	public String vaccineAdd(HttpSession session, Model model) {
//		loggedMemberInfo = (AdminBean) session.getAttribute("loggedMemberInfo");
//		List<ReserveBean> reserveBeanList = centerAdminDao.getCenterReserveList(loggedMemberInfo.getCenterName());
//		model.addAttribute("reserveList", reserveBeanList);
		return "centerAdmin/reserveList";
	}
}
