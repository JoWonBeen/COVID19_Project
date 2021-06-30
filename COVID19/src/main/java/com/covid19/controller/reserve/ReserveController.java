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
import org.springframework.web.bind.annotation.ResponseBody;

import com.covid19.model.CenterAdmin.CenterAdminDao;
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
	MemberBean loggedMemberBean;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	ReserveDao reserveDao;
	
	@Autowired
	ReserveBean reserveBean;
	
	@Autowired
	CenterAdminDao centerAdminDao;
	
	@RequestMapping(value="/ReserveForm.do" , produces = "application/json; charset=UTF-8;")
	public String reserveForm(HttpServletResponse response, HttpSession session,Model model) throws IOException {
		memberBean = (MemberBean) session.getAttribute("loggedMemberInfo"); 
		int result = reserveDao.checkReserve(memberBean.getId());
		
		if (memberBean.getTargetCheck() == 0) { 
			ScriptWriterUtil.alertAndNext(response, "접종 대상자 조회를 해주세요.", "PickedWriteForm.do");
			return null;
		}
		
		if (result > 0) { 
			reserveBean = reserveDao.getAllReservation(memberBean.getId());
			model.addAttribute("reserveBean", reserveBean);
			ScriptWriterUtil.alertAndNext(response, "예약내역이 존재합니다.", "ReserveList.do");
			return null;
		} else {
			return "reserve/reserve_write";
		}
	}
	
	@PostMapping("/ReserveWrite.do")
	public String reserveWrite(HttpServletResponse response,HttpServletRequest request, Model model) throws IOException {
		
		String gubun = request.getParameter("gubun");
		String vaccine = request.getParameter("vaccine");
		String hospitalAdd = request.getParameter("sido")+" "+request.getParameter("sigungu")+" "+ request.getParameter("roadName") + " " + request.getParameter("hospital");
		String reserveMemberId = request.getParameter("loggedMemberId");
		String reserveDate = request.getParameter("date");
		String year = reserveDate.substring(6); 
		String month = reserveDate.substring(0, 2);
		String day = reserveDate.substring(3,5);
		reserveDate = year + "-" + month + "-" + day;
		String rsDate = reserveDate + " " + request.getParameter("hour") + ":" + request.getParameter("minute");
		
		reserveBean = new ReserveBean();
		reserveBean.setGubun(gubun);
		reserveBean.setVaccine(vaccine);
		reserveBean.setHospitalAdd(hospitalAdd);
		reserveBean.setRsDate(rsDate);
		reserveBean.setMemberId(reserveMemberId);
		model.addAttribute("reserveBean", reserveBean);
		int result = reserveDao.insertReserve(reserveBean);
		if (result > 0) {
			centerAdminDao.reduceVaccine(vaccine, hospitalAdd);
			ScriptWriterUtil.alertAndNext(response, "예약이 완료 되었습니다.", "ReserveList.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "예약이 완료 되지 않았습니다.");
			return null;
		}
		
		
	}
	
	@RequestMapping(value = "/ReserveList.do", produces = "application/json; charset=UTF-8;")
	public String reserveList(HttpServletRequest request,HttpServletResponse response, Model model, HttpSession session) throws IOException {
		memberBean = (MemberBean) session.getAttribute("loggedMemberInfo"); 
		
		if (memberBean.getTargetCheck() == 0) { 
			ScriptWriterUtil.alertAndNext(response, "접종 대상자 조회를 해주세요.", "PickedWriteForm.do");
			return null;
		}
		
		int result = reserveDao.checkReserve(memberBean.getId());
		if (result > 0) { 
			reserveBean = reserveDao.getAllReservation(memberBean.getId());
			String[] addArr = reserveBean.getHospitalAdd().split(" ");
			reserveBean.setHospitalAdd(addArr[addArr.length-1]);
			model.addAttribute("reserveBean", reserveBean);
			return "reserve/reserve_list";
		} else {
			reserveBean = reserveDao.getAllReservation(memberBean.getId()); // 예약내역 확인
			model.addAttribute("reserveBean", reserveBean);
			ScriptWriterUtil.alertAndNext(response, "예약내역이 없습니다.", "ReserveForm.do");
			return null;
		}
	}
	@GetMapping("/ReserveModifyForm.do")
	public String reserveModifyForm() {
		return "reserve/reserve_modify";
	}
	@PostMapping("/ReserveModify.do")
	public String reserveModify(HttpServletResponse response, Model model, HttpSession session,HttpServletRequest request) throws IOException {
		memberBean = (MemberBean) session.getAttribute("loggedMemberInfo");
		reserveBean = reserveDao.getAllReservation(memberBean.getId());
		String gubun = request.getParameter("gubun");
		String vaccine = request.getParameter("vaccine");
		String hospitalAdd = request.getParameter("sido")+" "+request.getParameter("sigungu")+" "+request.getParameter("hospital");
		String reserveMemberId = request.getParameter("loggedMemberId");
		String reserveDate = request.getParameter("date");
		String year = reserveDate.substring(6); 
		String month = reserveDate.substring(0, 2);
		String day = reserveDate.substring(3,5);
		reserveDate = year + "-" + month + "-" + day;
		String rsDate = reserveDate + " " + request.getParameter("hour") + ":" + request.getParameter("minute");
		reserveBean.setGubun(gubun);
		reserveBean.setVaccine(vaccine);
		reserveBean.setHospitalAdd(hospitalAdd);
		reserveBean.setRsDate(rsDate);
		reserveBean.setMemberId(reserveMemberId);
		model.addAttribute("reserveBean", reserveBean);
		int result = reserveDao.updateReserve(reserveBean);
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "예약이 수정되었습니다.", "ReserveList.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "예약이 수정되지 않았습니다.");
			return null;
		}
		
	}
	@GetMapping("/ReserveDeleteForm.do")
	public String reserveDeleteForm(HttpServletRequest request, Model model) {
		String hospitalAdd = request.getParameter("hospitalAdd");
		String vaccine = request.getParameter("vaccine");
		request.setAttribute("vaccine", vaccine);
		request.setAttribute("hospitalAdd", hospitalAdd);
		return "reserve/reserve_delete";
	}
	@PostMapping("/ReserveDelete.do")
	public String reserveDelete(HttpServletResponse response, HttpSession session,HttpServletRequest request) throws IOException {
		
		loggedMemberBean = (MemberBean) session.getAttribute("loggedMemberInfo");
		
		String password = request.getParameter("password");
		
		if(password.equals(loggedMemberBean.getPassword())) {
			int result = reserveDao.deleteReserve(loggedMemberBean.getId());
			if(result > 0) {
				String hospitalAdd = request.getParameter("hospitalAdd");
				String vaccine = request.getParameter("vaccine");
				centerAdminDao.addOneVaccine(vaccine, hospitalAdd);
				ScriptWriterUtil.alertAndNext(response, "예약이 취소되었습니다.", "Index.do");
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
	
	@RequestMapping("/GetReserveData.do")
	@ResponseBody
	public ReserveBean getReserveData(HttpSession session) {
		memberBean = (MemberBean) session.getAttribute("loggedMemberInfo");
		reserveBean = reserveDao.getAllReservation(memberBean.getId());
		return reserveBean;
	}
	
	@RequestMapping("/GetHospitalByAddress.do")
	@ResponseBody
	public List<String> getHospitalByAddress(String mainArea, String detailArea, String roadName) {
		List<String> hospitalList = reserveDao.getHospitalByAddress(mainArea, detailArea, roadName);
		return hospitalList;
	}
	@RequestMapping("/GetVaccineCountInfo.do")
	@ResponseBody
	public List<String> getVaccineCountInfo(String mainArea, String detailArea, String roadName, String hospitalName) {
		List<String> hospitalList = reserveDao.getVaccineCountInfo(mainArea, detailArea, roadName, hospitalName);
		return hospitalList;
	}

}

