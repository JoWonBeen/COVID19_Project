package com.covid19.controller.coronaLive;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.covid19.model.coronaLive.CoronaDateInfoBean;
import com.covid19.model.coronaLive.CoronaLiveDao;
import com.covid19.model.coronaLive.CoronaSidoInfoBean;

@Controller
public class CoronaApiController {
	
	@Autowired 
	CoronaSidoInfoBean coronaSidoInfoBean;
	
	@Autowired 
	CoronaDateInfoBean coronaDateInfoBean;
	
	@Autowired 
	CoronaLiveDao coronaLiveDao;
	
	
	@RequestMapping(value="/CoronaApiCallArea.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public String CoronaApiCallArea(String start, String end) {
		StringBuilder sb = new StringBuilder();
        try {
        	StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=TNAnRP7WiL4Eh5Cl3ky3%2Fi550iw24fmyTTi9UzP6uTnhPAan%2FhRVD1pCwaIxAQ1PY7ZhvUpVJ8L0p8hXBkqt8w%3D%3D");
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); 
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); 
	        urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(start, "UTF-8")); 
	        urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(end, "UTF-8")); 
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
	
	@RequestMapping(value="/CoronaApiCallDate.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public String CoronaApiCallDate(String start, String end) {
		StringBuilder sb = new StringBuilder();
		try {
			StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=TNAnRP7WiL4Eh5Cl3ky3%2Fi550iw24fmyTTi9UzP6uTnhPAan%2FhRVD1pCwaIxAQ1PY7ZhvUpVJ8L0p8hXBkqt8w%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(start, "UTF-8")); /*검색할 생성일 범위의 시작*/
	        urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(end, "UTF-8")); /*검색할 생성일 범위의 종료*/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
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
        } catch (Exception e) {
			e.printStackTrace();
		} 
		return sb.toString();
	}
	
	
	@RequestMapping(value="/InsertCoronaInfo.do",produces="application/json;charset=UTF-8;")
	@ResponseBody //String stateDt,int deathCnt,int decideCnt,int clearCnt,int localOccCnt
	public int insertCoronaInfo(@RequestParam(value="dataList") String dataList) {
		int result = 0;
		String[] dataList1 = dataList.split("&");
		for(int i = 0; i < dataList1.length; i++) {
			String[] dataList2 = dataList1[i].split("/");
			coronaDateInfoBean.setStartDate(dataList2[0]);
			coronaDateInfoBean.setDeathCnt(Integer.parseInt(dataList2[1]));
			coronaDateInfoBean.setDecideCnt(Integer.parseInt(dataList2[2]));
			coronaDateInfoBean.setClearCnt(Integer.parseInt(dataList2[3]));
			result = coronaLiveDao.insertCoronaDateInfo(coronaDateInfoBean);
		}
		result = coronaLiveDao.updateTodayCnt();

		return result;
	}
	
	@RequestMapping(value="/GetLastDate.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public String getLastDate() {
		String lastDate = coronaLiveDao.getLastDate();
		return lastDate;
	}
	
	
	@RequestMapping(value="/InsertCoronaInfoSido.do",produces="application/json;charset=UTF-8;")
	@ResponseBody //String stateDt,int deathCnt,int decideCnt,int clearCnt,int localOccCnt
	public int insertCoronaInfoSido(@RequestParam(value="dataList") String dataList) {
		int result = 0;
		String[] dataList1 = dataList.split("&");
		for(int i = 0; i < dataList1.length; i++) {
			String[] dataList2 = dataList1[i].split("/");
			coronaSidoInfoBean.setStartDate(dataList2[0]);
			coronaSidoInfoBean.setDeathCnt(Integer.parseInt(dataList2[1]));
			coronaSidoInfoBean.setDefCnt(Integer.parseInt(dataList2[2]));
			coronaSidoInfoBean.setArea(dataList2[3]);
			result = coronaLiveDao.insertCoronaDateInfoSido(coronaSidoInfoBean);
		}
		result = coronaLiveDao.deleteRepeatDate();
		result = coronaLiveDao.updateTodayCntSido();

		return result;
	}
	
	@RequestMapping(value="/GetLastDateSido.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public String getLastDateSido() {
		String lastDate = coronaLiveDao.getLastDateSido();
		return lastDate;
	}
	
}
