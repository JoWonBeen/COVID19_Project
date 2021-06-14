package com.covid19.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.covid19.model.member.AdminBean;
import com.covid19.model.member.MemberBean;
import com.covid19.model.member.MemberDao;
import com.covid19.utils.ScriptWriterUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
public class MemberController {
	@Autowired
	MemberDao memberDao;

	@Autowired
	MemberBean memberBean;

	@Autowired
	AdminBean adminBean;
	
	@Autowired
	MemberBean loggedMemberInfo;



	@GetMapping("/LoginForm.do")
	public String memberLoginForm() {
		return "member/loginForm";
	}
	@GetMapping("/SignUp.do")
	public String signUp() {
		return "member/signUp";
	}

	@GetMapping("/AdminJoinForm.do")
	public String adminJoinForm() {
		return "member/adminJoinForm";
	}
	@GetMapping("/MemberJoinForm.do")
	public String memberJoinFrom() {
		return "member/memberJoinForm";
	}
	@PostMapping("/AdminJoin.do")
	public String adminSignUp(AdminBean adminBean, HttpServletRequest request, HttpServletResponse response) throws IOException {
		int result = memberDao.insertAdmin(adminBean);
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "회원가입 성공","LoginForm.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "회원가입 실패");
			return null;
		}
	}
	@PostMapping("/MemberJoin.do")
	public String memberJoin(MemberBean memberBean, HttpServletRequest request, HttpServletResponse response) throws IOException {

		int result = memberDao.insertMember(memberBean);
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "회원가입 성공","LoginForm.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "회원가입 실패");
			return null;
		}
	}





	
	
	
	
	
	

	@PostMapping("/MemberLogin.do")
	public String memberLogin(HttpServletResponse response, HttpSession session , String id, String password) throws IOException {
		memberBean.setId(id);
		memberBean.setPassword(password);
		loggedMemberInfo = memberDao.getLoginMember(memberBean);

		if(loggedMemberInfo != null) {
			ScriptWriterUtil.alertAndNext(response, "로그인 되었습니다.", "Index.do");
			session.setAttribute("loggedMemberInfo", loggedMemberInfo);
		} else {
			ScriptWriterUtil.alertAndBack(response, "아이디와 비밀번호를 확인해주세요.");
		}
		return null;
	}

	@GetMapping("/MemberLogout.do")
	public String memberLogout(HttpServletResponse response, HttpSession session) throws IOException {
		loggedMemberInfo = (MemberBean) session.getAttribute("loggedMemberInfo");
		ScriptWriterUtil.alertAndNext(response, "로그아웃 되었습니다.", "BoardList.do");
		session.invalidate();
		return null;
	}

	@RequestMapping(value = "/MemberIdCheck.do", produces = "application/json; charset=UTF-8;")
	@ResponseBody
	public String memberIdCheck(Model model, String id) throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
		int result = memberDao.MemberIdCheck(id);

		HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
		hashMap.put("result", result);
		String jsonData = objectMapper.writeValueAsString(hashMap);

		return jsonData;
	}
	
	@RequestMapping(value = "/AdminIdCheck.do", produces = "application/json; charset=UTF-8;")
	@ResponseBody
	public String adminIdCheck(Model model, String id) throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
		int result = memberDao.AdminIdCheck(id);

		HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
		hashMap.put("result", result);
		String jsonData = objectMapper.writeValueAsString(hashMap);

		return jsonData;
	}




	//	
	//	@GetMapping("/MemberInfo.do")
	//	public String memberInfo(int no,Model model) {
	//		memberBean = memberDao.getSelectOneMember(no);
	//		model.addAttribute("memberBean", memberBean);
	//		return "member/member_info";
	//	}
	//	
	//	@GetMapping("/MemberUpdateForm.do")
	//	public String memberUpdateForm(int no,Model model) {
	//		memberBean = memberDao.getSelectOneMember(no);
	//		model.addAttribute("memberBean", memberBean);
	//		return "member/member_update";
	//	}
	//	
	//	@PostMapping("/MemberUpdate.do")
	//	public String memberUpdate(MemberBean memberBean, int no, HttpServletRequest request,HttpServletResponse response) throws IOException {
	//
	//		String dbPassword = memberDao.getPasswordMember(no);
	//		logger.info("dbPassword==={}",dbPassword);
	//		logger.info("memberBean.getPasswordMember()==={}",memberBean.getPassword());
	//		
	//		if (dbPassword.equals(memberBean.getPassword())) {
	//			int result = memberDao.updateMember(memberBean);
	//			if(result > 0) {
	//				logger.info("result==={}",result);
	//				logger.info("page==={}","member_list");
	//				ScriptWriterUtil.alertAndNext(response, "�쉶�썝�젙蹂닿� 蹂�寃쎈릺�뿀�뒿�땲�떎.", "MemberList.do");
	//				return null;
	//				
	//			} else {
	//				logger.info("page==={}","update");
	//				ScriptWriterUtil.alertAndBack(response, "�쉶�썝�젙蹂닿� 蹂�寃쎌뿉 �떎�뙣�븯���뒿�땲�떎.");
	//				return null;
	//			}
	//		} else {
	//			logger.info("page==={}","update");
	//			ScriptWriterUtil.alertAndBack(response, " 鍮꾨�踰덊샇瑜� �솗�씤�빐 二쇱꽭�슂.");
	//			return null;
	//		}
	//	}
	//	

	//	
	//	@GetMapping("/MemberDeleteForm.do")
	//	public String memberDeleteForm(int no,Model model) {
	//		memberBean = memberDao.getSelectOneMember(no);
	//		model.addAttribute("memberBean", memberBean);
	//		return "member/member_delete";
	//	}
	//	
	//	@GetMapping("/MemberDelete.do")
	//	public String memberDelete(int no,Model model, String password,HttpServletResponse response) throws IOException {
	//		String dbPassword = memberDao.getPasswordMember(no); //db�뿉�꽌 �뱾怨좎삩 嫄�
	//		if(dbPassword.equals(password)){
	//			int result = memberDao.deleteMember(no);
	//			if(result>0) {
	//				ScriptWriterUtil.alertAndNext(response,"�쉶�썝�씠 �궘�젣�릺�뿀�뒿�땲�떎.","MemberList.do");
	//				return null;
	//			} else {
	//				ScriptWriterUtil.alertAndBack(response,"�쉶�썝 �궘�젣�뿉 �떎�뙣�뻽�뒿�땲�떎.");
	//				return null;
	//			}
	//		} else {
	//			ScriptWriterUtil.alertAndBack(response," 鍮꾨�踰덊샇瑜� �솗�씤�빐二쇱꽭�슂.");
	//			return null;
	//		}
	//	}

}
