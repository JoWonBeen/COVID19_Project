package com.covid19.controller.picked;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.covid19.model.member.MemberBean;
import com.covid19.model.member.MemberDao;
import com.covid19.model.picked.PickedBean;
import com.covid19.model.picked.PickedDao;
import com.covid19.model.reserve.ReserveBean;
import com.covid19.model.reserve.ReserveDao;

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
	
}
