package com.covid19.controller.CenterAdmin;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.covid19.model.CenterAdmin.CenterAdminDao;
import com.covid19.model.CenterAdmin.CenterVaccineInfoBean;
import com.covid19.model.member.AdminBean;
import com.covid19.utils.ScriptWriterUtil;

@Controller
public class AddVaccineController {
	@Autowired 
	CenterVaccineInfoBean centerVaccineInfoBean;
	
	@Autowired
	CenterAdminDao centerAdminDao;
	
	@Autowired
	AdminBean loggedMemberInfo;
	
	@RequestMapping(value="/VaccineAdd.do",produces="application/json;charset=UTF-8;")
	public String vaccineAdd(HttpSession session, Model model) {
		loggedMemberInfo = (AdminBean) session.getAttribute("loggedMemberInfo"); 
		List<CenterVaccineInfoBean> centerVaccineInfoBeanList = centerAdminDao.getCenterVaccineInfo(loggedMemberInfo.getCenterName());
		model.addAttribute("centerVaccineInfoBeanList",centerVaccineInfoBeanList);
		return "centerAdmin/vaccineAdd";
	}
	
	@RequestMapping(value="/UpdateCenterVaccineInfo.do",produces="application/json;charset=UTF-8;")
	public String updateCenterVaccineInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		loggedMemberInfo = (AdminBean) session.getAttribute("loggedMemberInfo");
		String[] vaccineCnt = request.getParameterValues("vaccineType");
		String[] vaccineType = {"화이자", "아스트라제네카", "얀센", "모더나"};
		int result = 0;
		for(int i = 0; i<vaccineCnt.length; i++) {
			result = centerAdminDao.updateCenterVaccineInfo(loggedMemberInfo.getCenterName(), vaccineType[i], vaccineCnt[i]);
		}
		if(result > 0) {
			ScriptWriterUtil.alertAndNext(response, "수량이 등록되었습니다.", "Index.do");
		}
		return null;
	}
	
}
