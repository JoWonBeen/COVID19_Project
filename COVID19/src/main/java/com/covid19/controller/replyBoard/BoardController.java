package com.covid19.controller.replyBoard;

import java.io.IOException;
import java.util.List;

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

import com.covid19.model.member.MemberBean;
import com.covid19.model.member.MemberDao;
import com.covid19.model.replyBoard.ReplyBoardBean;
import com.covid19.model.replyBoard.ReplyBoardDao;
import com.covid19.utils.ScriptWriterUtil;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	ReplyBoardDao replyBoardDao;

	@Autowired
	ReplyBoardBean replyBoardBean;
	
	@Autowired
	MemberBean loggedMemberBean;
	
	@Autowired
	MemberBean memberBean;
	
	@Autowired
	MemberDao memberDao;

	@GetMapping("/BoardList.do")
	public String boardList(HttpServletRequest request, Model model) {
		///pagination
		String clickedPage = request.getParameter("clickedPage");
		if (clickedPage == null) {
			clickedPage = "1";
		}
		int pagePerCount = 5;
		int total = 0;
		int numbering = 0;
		int currentPage = Integer.parseInt(clickedPage);
		int start = (currentPage - 1) * pagePerCount + 1;
		int end = currentPage * pagePerCount;
		total = replyBoardDao.getTotal();

		int paginationTotal = (int) Math.floor(total / pagePerCount) + 1;
		int pageGroup = 3;
		int startPage = 1;
		numbering = total - (currentPage - 1) * pagePerCount;

		if (currentPage % pageGroup != 0) {
			startPage = (int) (currentPage / pageGroup) * pageGroup + 1;
		} else {
			startPage = ((int) (currentPage / pageGroup) - 1) * pageGroup + 1;
		}
		int endPage = startPage + pageGroup - 1;
		if (endPage > paginationTotal) {
			endPage = paginationTotal;
		}

		List<ReplyBoardBean> replyBoardList = replyBoardDao.getAllBoard(start, end);

		model.addAttribute("replyBoardList", replyBoardList);
		model.addAttribute("numbering", numbering);
		model.addAttribute("paginationTotal", paginationTotal);
		model.addAttribute("pageGroup", pageGroup);
		model.addAttribute("pagePerCount", pagePerCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("total", total);
		model.addAttribute("clickedPage", clickedPage);
		model.addAttribute("currentPage", currentPage);

		return "reply_board/board_list";
	}


	@GetMapping("/BoardView.do")
	public String boardView(Model model, int no) {
		replyBoardBean = replyBoardDao.getSelectOneBoard(no);

		model.addAttribute("replyBoardBean", replyBoardBean);
		return "reply_board/board_view";
	}

	@GetMapping("/BoardDeleteForm.do")
	public String boardDeleteForm(Model model, int no) {
		replyBoardBean = replyBoardDao.getSelectOneBoard(no);

		model.addAttribute("replyBoardBean", replyBoardBean);
		model.addAttribute("no", no);
		return "reply_board/board_delete";	
	}

	@PostMapping("/BoardDelete.do")
	public String boardDelete(HttpSession session,HttpServletResponse response, HttpServletRequest request) throws IOException {

		loggedMemberBean = (MemberBean) session.getAttribute("loggedMemberInfo");
		String password = request.getParameter("password");

		if(password.equals(loggedMemberBean.getPassword())) {
			int result = replyBoardDao.deleteBoard(loggedMemberBean.getId());
			if(result > 0) {
				ScriptWriterUtil.alertAndNext(response, "글이 삭제되었습니다.", "BoardList.do");
				return null;
			} else {
				ScriptWriterUtil.alertAndBack(response, "글이 삭제되지 않았습니다.");
				return null;
			}
		} else {
			ScriptWriterUtil.alertAndBack(response, "비밀번호를 확인해 주세요.");
			return null;			
		}
	}

	@GetMapping("/BoardModifyForm.do")
	public String boardModifyForm(Model model, int no) {

		replyBoardBean = replyBoardDao.getSelectOneBoard(no);
		model.addAttribute("replyBoardBean", replyBoardBean);
		model.addAttribute("no", no);
		return "reply_board/board_modify";
	}
	
	@PostMapping("/BoardModify.do")
	public String boardModifyForm(ReplyBoardBean replyBoardBean, HttpServletResponse response, int no) throws IOException {
		String dbPassword = replyBoardDao.getPasswordBoard(no);
		if(dbPassword.equals(replyBoardBean.getPassword())) {
			
			int result = replyBoardDao.updateBoard(replyBoardBean); 
			if(result > 0) {
				ScriptWriterUtil.alertAndNext(response, "글이 수정되었습니다.", "BoardList.do");
				return null;
			} else {
				ScriptWriterUtil.alertAndBack(response, "글이 수정되지 않았습니다.");
				return null;
			}
		} else {
			ScriptWriterUtil.alertAndBack(response, "글이 수정되지 않았습니다.");
			return null;
		}
	}
	
	@GetMapping("/BoardWriteForm.do")
	public String boardWriteForm() {
		return "reply_board/board_write";
	}
	
	@PostMapping("/BoardWrite.do")
	public String boardWrite(ReplyBoardBean replyBoardBean, HttpServletResponse response) throws IOException {
		
		int result = replyBoardDao.insertBoard(replyBoardBean);

		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "글이 등록되었습니다.", "BoardList.do");
			return null;
			
		} else {
			ScriptWriterUtil.alertAndBack(response, "글이 등록되지 않았습니다.");
			return null;
		}
	}
	
	// 내보낼때는 JSON으로 결과를 내보낸다.
	// ResponseBody를 Annotation 하면 JSP를 호출하지 않고, 그냥 자기 자신을 보여준다.
	// 보통 JSON파일을 적용할 때 사용한다.

	@GetMapping("/BoardRewriteForm.do")
	public String boardRewriteForm(HttpServletRequest request, Model model) {
		int no = Integer.parseInt(request.getParameter("no"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		int reStep = Integer.parseInt(request.getParameter("reStep"));
		int reLevel = Integer.parseInt(request.getParameter("reLevel"));
		
		model.addAttribute("no", no);
		model.addAttribute("ref", ref);
		model.addAttribute("reStep", reStep);
		model.addAttribute("reLevel", reLevel);
		return "reply_board/board_rewrite";
	}
	
	
	@PostMapping("/BoardRewrite.do")
	public String boardRewrite(ReplyBoardBean replyBoardBean, HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		int result = replyBoardDao.rewriteBoard(replyBoardBean);
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "답글이 등록되었습니다.", "BoardList.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "답글이 등록되지 않았습니다.");
			return null;
		}
	}
}