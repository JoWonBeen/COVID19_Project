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
	
	@Autowired
	AdminBean loggedAdminInfo;


	@GetMapping("/LoginForm.do")
	public String memberLoginForm() {
		return "member/loginForm";
	}
	
	@PostMapping("/MemberLogin.do")
	public String memberLogin(HttpServletResponse response, HttpSession session , String id, String password) throws IOException {
		memberBean.setId(id);
		memberBean.setPassword(password);
		loggedMemberInfo = memberDao.getLoginMember(memberBean);
		
		adminBean.setId(id);
		adminBean.setPassword(password);
		loggedAdminInfo = memberDao.getLoginAdmin(adminBean);
		
		if(loggedMemberInfo != null) {
			ScriptWriterUtil.alertAndNext(response, "로그인 되었습니다.", "Index.do");
			session.setAttribute("loggedMemberInfo", loggedMemberInfo);
		} else if(loggedAdminInfo != null){
			ScriptWriterUtil.alertAndNext(response, "로그인 되었습니다.", "Index.do");
			session.setAttribute("loggedMemberInfo", loggedAdminInfo);			
		} else {
			ScriptWriterUtil.alertAndBack(response, "아이디 비밀번호를 확인해주세요");
		}
		return null;
	}
	
	@GetMapping("/MemberLogout.do")
	public String memberLogout(HttpServletResponse response, HttpSession session) throws IOException {
		ScriptWriterUtil.alertAndNext(response, "로그아웃 되었습니다.", "Index.do");
		session.invalidate();
		return null;
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


	@RequestMapping(value = "/MemberIdCheck.do", produces = "application/json; charset=UTF-8;")
	@ResponseBody
	public String memberIdCheck(Model model, String id) throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
		int resultMember = memberDao.MemberIdCheck(id);
		int resultAdmin = memberDao.AdminIdCheck(id);

		HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
		hashMap.put("resultMember", resultMember);
		hashMap.put("resultAdmin", resultAdmin);
		String jsonData = objectMapper.writeValueAsString(hashMap);

		return jsonData;
	}
	
		
	@GetMapping("/MemberInfo.do")
	public String memberInfo(int no, int type, Model model) {
		return "member/memberInfo";
	}
		
	@GetMapping("/MemberUpdateForm.do")
	public String memberUpdateForm(int no) {
		return "member/memberUpdate";
	}
	
	@RequestMapping("/MemberUpdate.do")
	public String memberUpdate(MemberBean memberBean, AdminBean adminBean, int no, int type, HttpServletRequest request,HttpServletResponse response) throws IOException {
		String dbPassword = "";
		String realPassword = "";
		if (type == 1) {
			dbPassword = memberDao.getPasswordMember(no);
			realPassword = memberBean.getPassword();
		} else if (type == 2) {
			dbPassword = memberDao.getPasswordAdmin(no);
			realPassword = adminBean.getPassword();
		}
		
		if (dbPassword.equals(realPassword)) {
			int result = 0;
			if (type == 1) {
				result = memberDao.updateMember(memberBean);
			} else if (type == 2) {
				result = memberDao.updateAdmin(adminBean);
			}
			if(result > 0) {
				ScriptWriterUtil.alertAndNext(response, "회원정보가 수정되었습니다.", "MemberInfo.do");
				return null;
			} else {
				ScriptWriterUtil.alertAndBack(response, "회원정보가 수정되지 않았습니다.");
				return null;
			}
		} else {
			ScriptWriterUtil.alertAndBack(response, "비밀번호가 일치하지 않습니다.");
			return null;
		}
	}
	

	
	@GetMapping("/MemberDeleteForm.do")
	public String memberDeleteForm(int no) {
		return "member/memberDelete";
	}
	
	@PostMapping("/MemberDelete.do")
	public String memberDelete(int no, String password, int type, HttpServletResponse response) throws IOException {
		String dbPassword = "";
		if (type == 1) {
			dbPassword = memberDao.getPasswordMember(no);
		} else if (type == 2) {
			dbPassword = memberDao.getPasswordAdmin(no);
		}
		
		if(dbPassword.equals(password)){
			int result = 0;
			if (type == 1) {
				result = memberDao.deleteMember(no);
			} else if (type == 2) {
				result = memberDao.deleteAdmin(no);
			}
			if(result > 0) {
				ScriptWriterUtil.alertAndNext(response,"회원탈퇴 되었습니다.", "MemberLogout.do");
				return null;
			} else {
				ScriptWriterUtil.alertAndBack(response,"회원탈퇴에 실패했습니다.");
				return null;
			}
		} else {
			ScriptWriterUtil.alertAndBack(response,"비밀번호가 일치하지 않습니다.");
			return null;
		}
	}

}
