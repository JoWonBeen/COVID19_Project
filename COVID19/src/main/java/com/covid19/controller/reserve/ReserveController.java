package com.covid19.controller.reserve;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.covid19.model.reserve.ReserveBean;
import com.covid19.model.reserve.ReserveDao;
import com.covid19.utils.ScriptWriterUtil;

@Controller
public class ReserveController {
	
	@Autowired
	ReserveDao reserveDao;
	
	@Autowired
	ReserveBean reserveBean;
	
	@GetMapping("/ReserveForm.do")
	public String reserveForm(HttpServletRequest request, Model model) {
		String gubun = request.getParameter("gubun");
		String vaccine = request.getParameter("vaccine");
		String hospitalAdd = request.getParameter("hospitalAdd");
		String rsDate = request.getParameter("rsDate");
		String regDate = request.getParameter("regDate");
		
		
		model.addAttribute("gubun", gubun);
		model.addAttribute("vaccine", vaccine);
		model.addAttribute("hospitalAdd", hospitalAdd);
		model.addAttribute("rsDate", rsDate);
		model.addAttribute("regDate", regDate);
		return "reserve/reserve_write";
	}
	@PostMapping("/ReserveWrite.do")
	public String reserveWrite(ReserveBean reserveBean, HttpServletResponse response) throws IOException {
		
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
	public String reserveList(HttpServletRequest request, Model model) {
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
		total = reserveDao.getTotal();

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

		List<ReserveBean> reserveList = reserveDao.getAllReservation(start, end);

		model.addAttribute("reserveList", reserveList);
		model.addAttribute("numbering", numbering);
		model.addAttribute("paginationTotal", paginationTotal);
		model.addAttribute("pageGroup", pageGroup);
		model.addAttribute("pagePerCount", pagePerCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("total", total);
		model.addAttribute("clickedPage", clickedPage);
		model.addAttribute("currentPage", currentPage);

		return "reserve/reserve_list";
	}
}
