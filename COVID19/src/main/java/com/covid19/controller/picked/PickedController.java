package com.covid19.controller.picked;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.covid19.model.member.MemberBean;
import com.covid19.model.member.MemberDao;
import com.covid19.model.picked.PickedBean;
import com.covid19.model.picked.PickedDao;
import com.covid19.model.reserve.ReserveBean;
import com.covid19.model.reserve.ReserveDao;
import com.covid19.utils.ScriptWriterUtil;

@Controller
public class PickedController {

	@Autowired
	MemberBean memberBean;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	ReserveDao reserveDao;
	
	@Autowired
	ReserveBean reserveBean;
	
	@Autowired
	PickedBean pickedBean;
	
	@Autowired
	PickedDao pickedDao;
	
	@GetMapping("/PickedWriteForm.do")
	public String pickedWriteForm() {
		return "picked/picked_writeForm";
	}
	
	@GetMapping("/TargetCheck.do")
	public String targetCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		String birth = request.getParameter("birth");
		String special = request.getParameter("special");
		String pragnent = request.getParameter("pragnent");
		
		if(pragnent.equals("yes")) {
			ScriptWriterUtil.alertAndNext(response, "임산부는 접종 대상자가 아닙니다.", "Index.do");
			return null;
		} else if(special.equals("yes")) {
			memberBean = (MemberBean) session.getAttribute("loggedMemberInfo"); 
			memberBean.setTargetCheck(1);
			memberDao.updateMemberTargetCheck(memberBean.getId());
			session.setAttribute("loggedMemberInfo", memberBean);
			ScriptWriterUtil.alertAndNext(response, "특수직군 종사자는 접종 대상자입니다. 예방 접종 예약이 가능합니다.", "ReserveForm.do");
			return null;
		} else if(Integer.parseInt(birth.substring(0,2)) > 91) {
			ScriptWriterUtil.alertAndNext(response, "연령대가 접종 대상자에 해당하지 않습니다.", "Index.do");
			return null;
		} else {
			memberBean = (MemberBean) session.getAttribute("loggedMemberInfo"); 
			memberBean.setTargetCheck(1);
			memberDao.updateMemberTargetCheck(memberBean.getId());
			session.setAttribute("loggedMemberInfo", memberBean);
			ScriptWriterUtil.alertAndNext(response, "연령대가 접종 대상자입니다. 예방 접종 예약이 가능합니다.", "ReserveForm.do");
			return null;
		}
	}
	
}
