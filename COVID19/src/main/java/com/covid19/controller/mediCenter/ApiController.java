package com.covid19.controller.mediCenter;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.covid19.model.mediCenter.MediCenterBean;
import com.covid19.model.mediCenter.MediCenterDao;

@Controller
public class ApiController {
	
	@Autowired 
	MediCenterBean mediCenterBean;
	
	@Autowired
	MediCenterDao mediCenterDao;
	
	@RequestMapping(value="/VaccCenterApiCall.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String vaccCenterApiCall(String date) {
		
		StringBuilder sb = new StringBuilder();
        try {
        	StringBuilder urlBuilder = new StringBuilder("https://api.odcloud.kr/api/15077586/v1/centers"); /*URL*/
        	urlBuilder.append("?" + URLEncoder.encode("page","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        	urlBuilder.append("&" + URLEncoder.encode("perPage","UTF-8") + "=" + URLEncoder.encode("49", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("serviceKey","UTF-8") + "=2MQP2Jqoof9NxfXQ8oLwNvYMcm1OdhGVzEgDikf%2BtaB0RSFmbFXey3Jnd5QBanWx4tpWFe6ZUk1j1GO5G%2FDlFQ%3D%3D");
			
			//urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode("20210615", "UTF-8")); /*검색할 생성일 범위의 시작*/
			//urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode("20210615", "UTF-8")); /*검색할 생성일 범위의 종료*/
			urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*json타입으로 변환*/
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("content-type", " application/json; charset=UTF-8");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			System.out.println(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} /*Service Key*/
		
		return sb.toString();
	}
	
	@RequestMapping(value="/ConsignedInstApiCall.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String ConsignedInstApiCall(String date) {
		
		StringBuilder sb = new StringBuilder();
		try {
			StringBuilder urlBuilder = new StringBuilder("https://api.odcloud.kr/api/apnmOrg/v1/list"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("page","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("perPage","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("serviceKey","UTF-8") + "=2MQP2Jqoof9NxfXQ8oLwNvYMcm1OdhGVzEgDikf%2BtaB0RSFmbFXey3Jnd5QBanWx4tpWFe6ZUk1j1GO5G%2FDlFQ%3D%3D");
			
			//urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode("20210615", "UTF-8")); /*검색할 생성일 범위의 시작*/
			//urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode("20210615", "UTF-8")); /*검색할 생성일 범위의 종료*/
			urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*json타입으로 변환*/
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("content-type", " application/json; charset=UTF-8");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			System.out.println(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} /*Service Key*/
		
		return sb.toString();
	}
	
	@RequestMapping(value="/mediCenterInfo.do",produces="application/json;charset=UTF-8;")
	@ResponseBody //String centerName, String address, String phoneNumber
	public int insertMediCenterInfo(@RequestParam(value="dataList") String dataList) {
		int result = 0;
		String[] dataList1 = dataList.split("&");
		for(int i = 0; i < dataList1.length; i++) {
			String[] dataList2 = dataList1[i].split("/");
			coronaDateInfoBean.setStartDate(dataList2[0]);
			coronaDateInfoBean.setDeathCnt(Integer.parseInt(dataList2[1]));
			coronaDateInfoBean.setDecideCnt(Integer.parseInt(dataList2[2]));
			coronaDateInfoBean.setClearCnt(Integer.parseInt(dataList2[3]));
			coronaDateInfoBean.setTodayCnt(Integer.parseInt(dataList2[4]));
			result = coronaLiveDao.insertCoronaDateInfo(coronaDateInfoBean);
		}

		return result;
	}
	
	@RequestMapping(value="/GetMediCenterData.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public String getMediCenter() {
		String mediCenter = mediCenterDao.getmediCenterData();
		return mediCenter;
	}
	
	
	
	@RequestMapping("/MediCenterSearch.do")
	public String mediCenterSearch() {
		
		
		return "mediCenter/mediCenterSearch";
	}
}