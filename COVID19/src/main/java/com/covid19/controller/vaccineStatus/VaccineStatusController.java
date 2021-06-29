package com.covid19.controller.vaccineStatus;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.covid19.model.vaccineStatus.VaccineStatusBean;
import com.covid19.model.vaccineStatus.VaccineStatusDao;

@Controller
public class VaccineStatusController {
	
	@Autowired
	VaccineStatusBean vaccineStatusBean;
	
	@Autowired
	VaccineStatusDao vaccineStatusDao;
	
	
	@RequestMapping(value="/GetVaccineMainData.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public VaccineStatusBean getVaccineMainData(String area) {
		vaccineStatusBean = vaccineStatusDao.getVaccineMainData(area);
		return vaccineStatusBean;
	}

	@RequestMapping(value="/GetVaccineAreaData.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public List<VaccineStatusBean> getVaccineMainData() {
		List<VaccineStatusBean> vaccineStatusBean = vaccineStatusDao.getVaccineAreaData();
		return vaccineStatusBean;
	}
	
	// 모든 지역을 통합한 데이터 가져오기.
	@RequestMapping(value="/GetVaccineAllData.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public List<VaccineStatusBean> getVaccineAllData(int type, String period) {
		List<VaccineStatusBean> vaccineStatusBean = vaccineStatusDao.getVaccineAllData(type, period);
		return vaccineStatusBean;
	}
	
	// 특정 지역 데이터 가져오기.
	@RequestMapping(value="/GetVaccineAllAreaData.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public List<VaccineStatusBean> getVaccineAllAreaData(int type, int period, String area) {
		List<VaccineStatusBean> vaccineStatusBean = vaccineStatusDao.getVaccineAllAreaData(type, period, area);
		return vaccineStatusBean;
	}
	
	
	
}
