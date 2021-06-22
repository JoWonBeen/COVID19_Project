package com.covid19.controller.coronaLive;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.covid19.model.coronaLive.CoronaDateInfoBean;
import com.covid19.model.coronaLive.CoronaLiveDao;
import com.covid19.model.coronaLive.CoronaSidoInfoBean;

@Controller
public class CoronaChartController {
	@Autowired 
	CoronaSidoInfoBean coronaSidoInfoBean;
	
	@Autowired 
	CoronaDateInfoBean coronaDateInfoBean;
	
	@Autowired 
	CoronaLiveDao coronaLiveDao;
	
	// 모든 지역을 통합한 데이터 가져오기.
	@RequestMapping(value="/GetAllAreaData.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public List<CoronaDateInfoBean> getAllAreaData(int type, String period) {
		List<CoronaDateInfoBean> coronaDateInfoBeanList = coronaLiveDao.getAllAreaData(type, period);
		return coronaDateInfoBeanList;
	}
	
	// 특정 지역 데이터 가져오기.
	@RequestMapping(value="/GetAreaData.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public List<CoronaSidoInfoBean> getAreaData(int type, int period, String area) {
		List<CoronaSidoInfoBean> coronaSidoInfoBeanList = coronaLiveDao.getAreaData(type, period, area);
		return coronaSidoInfoBeanList;
	}
	
	@RequestMapping(value="/GetMainData.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public CoronaDateInfoBean getMainData() {
		coronaDateInfoBean = coronaLiveDao.getMainData();
		return coronaDateInfoBean;
	}
	@RequestMapping(value="/GetAreaTodayData.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public List<CoronaSidoInfoBean> getAreaTodayData() {
		List<CoronaSidoInfoBean> coronaSidoInfoBeanList = coronaLiveDao.getAreaTodayData();
		return coronaSidoInfoBeanList;
	}
	
	
}
