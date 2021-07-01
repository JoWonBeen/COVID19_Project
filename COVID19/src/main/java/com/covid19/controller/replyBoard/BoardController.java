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
import org.springframework.web.bind.annotation.RequestMapping;

import com.covid19.model.member.AdminBean;
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
	public String boardView(Model model, int no, String memberId, int type, int ref, HttpSession session, HttpServletResponse response) throws IOException {
		if(type == 3) {
			replyBoardBean = replyBoardDao.getSelectOneBoard(no);
			model.addAttribute("replyBoardBean", replyBoardBean);
			return "reply_board/board_view";
		} else {
			loggedMemberBean = (MemberBean) session.getAttribute("loggedMemberInfo");
			List<Integer> refList = replyBoardDao.getSelectMyBoard(loggedMemberBean.getId());
			if(refList.contains(ref)) {
				replyBoardBean = replyBoardDao.getSelectOneBoard(no);
				model.addAttribute("replyBoardBean", replyBoardBean);
				return "reply_board/board_view";
			} else {
				ScriptWriterUtil.alertAndBack(response, "비밀글 입니다.");
				return null;			
			}
		}
	}

	@GetMapping("/BoardDeleteForm.do")
	public String boardDeleteForm(Model model, int no) {
		replyBoardBean = replyBoardDao.getSelectOneBoard(no);

		model.addAttribute("replyBoardBean", replyBoardBean);
		return "reply_board/board_delete";	
	}

	@RequestMapping("/BoardDelete.do")
	public String boardDelete(HttpSession session,HttpServletResponse response, HttpServletRequest request) throws IOException {

		int ref = Integer.parseInt(request.getParameter("ref"));
		int result = replyBoardDao.deleteBoard(ref);
		if(result > 0) {
			ScriptWriterUtil.alertAndNext(response, "글이 삭제되었습니다.", "BoardList.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "글이 삭제되지 않았습니다.");
			return null;
		}
	}

	@GetMapping("/BoardModifyForm.do")
	public String boardModifyForm(Model model, int no) {

		replyBoardBean = replyBoardDao.getSelectOneBoard(no);
		model.addAttribute("replyBoardBean", replyBoardBean);
		return "reply_board/board_modify";
	}
	
	@RequestMapping("/BoardModify.do")
	public String boardModifyForm(ReplyBoardBean replyBoardBean, HttpSession session,HttpServletRequest request, HttpServletResponse response,Model model) throws IOException {
		
		int result = replyBoardDao.updateBoard(replyBoardBean);
		if(result > 0) {
			ScriptWriterUtil.alertAndNext(response, "글이 수정되었습니다.", "BoardList.do");
			return null;
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
	public String boardWrite(ReplyBoardBean replyBoardBean, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
		int result = replyBoardDao.insertBoard(replyBoardBean);
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "글이 등록되었습니다.", "BoardList.do");
			return null;
			
		} else {
			ScriptWriterUtil.alertAndBack(response, "글이 등록되지 않았습니다.");
			return null;
		}
	}
	

	@GetMapping("/BoardRewriteForm.do")
	public String boardRewriteForm(ReplyBoardBean replyBoardBean, Model model) {
		model.addAttribute("replyBoardBean", replyBoardBean);
		return "reply_board/board_rewrite";
	}
	
	
	@RequestMapping("/BoardRewrite.do")
	public String boardRewrite(ReplyBoardBean replyBoardBean, HttpServletResponse response) throws IOException {
	
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
