package com.covid19.controller.reserve;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.covid19.model.member.MemberBean;
import com.covid19.model.member.MemberDao;
import com.covid19.model.reserve.ReserveBean;
import com.covid19.model.reserve.ReserveDao;
import com.covid19.utils.ScriptWriterUtil;

@Controller
public class ReserveController {
	
	@Autowired
	MemberBean memberBean;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	ReserveDao reserveDao;
	
	@Autowired
	ReserveBean reserveBean;
	
	@GetMapping("/ReserveForm.do")
	public String reserveForm() {
		
		return "reserve/reserve_write";
	}
	
	@PostMapping("/ReserveWrite.do")
	public String reserveWrite(HttpServletResponse response,HttpServletRequest request, Model model) throws IOException {
		
		String gubun = request.getParameter("gubun");
		String vaccine = request.getParameter("vaccine");
		String hospitalAdd = request.getParameter("sido")+" "+request.getParameter("sigungu")+" "+request.getParameter("hospital");
		String reserveMemberId = request.getParameter("loggedMemberId");
		String reserveDate = request.getParameter("date");
		String year = reserveDate.substring(6); 
		String month = reserveDate.substring(0, 2);
		String day = reserveDate.substring(3,5);
		reserveDate = year + "-" + month + "-" + day;
		System.out.println(reserveDate);
		String rsDate = reserveDate + " " + request.getParameter("hour") + ":" + request.getParameter("minute");
		reserveBean.setGubun(gubun);
		reserveBean.setVaccine(vaccine);
		reserveBean.setHospitalAdd(hospitalAdd);
		reserveBean.setRsDate(rsDate);
		reserveBean.setMemberId(reserveMemberId);
		System.out.println(reserveBean.toString());
		model.addAttribute("reserveBean", reserveBean);
		int result = reserveDao.insertReserve(reserveBean);
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "글이 등록되었습니다.", "ReserveList.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "글이 등록되지 않았습니다.");
			return null;
		}
		
		
	}
	@RequestMapping(value = "/ReserveList.do", produces = "application/json; charset=UTF-8;")
	public String reserveList(HttpServletRequest request, Model model, HttpSession session) {
		memberBean = (MemberBean) session.getAttribute("loggedMemberInfo");
		reserveBean = reserveDao.getAllReservation(memberBean.getId());
		model.addAttribute("reserveBean", reserveBean);
		return "reserve/reserve_list";
	}
	@GetMapping("/ReserveModifyForm.do")
	public String reserveModifyForm() {
		
		return "reserve/reserve_modify";
	}
	@PostMapping("/ReserveModify.do")
	public String reserveModify(HttpServletResponse response, Model model, HttpSession session) throws IOException {
		memberBean = (MemberBean) session.getAttribute("loggedMemberInfo");
		reserveBean = reserveDao.getAllReservation(memberBean.getId());
		model.addAttribute("reserveBean", reserveBean);
		int result = reserveDao.updateReserve(reserveBean);
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "글이 수정되었습니다.", "ReserveList.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "글이 수정되지 않았습니다.");
			return null;
		}
		
	}
	@GetMapping("/ReserveDeleteForm.do")
	public String reserveDeleteForm() {
		
		return "reserve/reserve_delete";
	}
	@PostMapping("/ReserveDelete.do")
	public String reserveDelete(HttpServletResponse response,String MemberId,String password) throws IOException {
		
		memberBean.setPassword(password);
		
		String dbPassword = reserveDao.getPassword(MemberId);
		if(dbPassword.equals(memberBean.getPassword())) {
			int result = reserveDao.deleteReserve(MemberId);
			if(result > 0) {
				ScriptWriterUtil.alertAndNext(response, "예약이 취소되었습니다.", "BoardList.do");
				return null;
			} else {
				ScriptWriterUtil.alertAndBack(response, "예약이 취소되지 않았습니다.");
				return null;
			}
		} else {
			ScriptWriterUtil.alertAndBack(response, "비밀번호를 확인해 주세요.");
			return null;			
		}
	}
}

