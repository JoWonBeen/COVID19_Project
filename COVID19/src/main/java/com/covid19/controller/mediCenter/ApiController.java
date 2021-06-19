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

	@RequestMapping(value = "/VaccCenterApiCall.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String vaccCenterApiCall() {

		StringBuilder sb = new StringBuilder();
		try {
			StringBuilder urlBuilder = new StringBuilder("https://api.odcloud.kr/api/15077586/v1/centers"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("page", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("perPage", "UTF-8") + "="+ URLEncoder.encode("49", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8") + "=2MQP2Jqoof9NxfXQ8oLwNvYMcm1OdhGVzEgDikf%2BtaB0RSFmbFXey3Jnd5QBanWx4tpWFe6ZUk1j1GO5G%2FDlFQ%3D%3D");
			urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* json타입으로 변환 */

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("content-type", " application/json; charset=UTF-8");
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
		} /* Service Key */

		return sb.toString();
	}

	@RequestMapping(value = "/ConsignedInstApiCall.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ConsignedInstApiCall(@RequestParam(value = "sendData") String sendData) {

		StringBuilder sb = new StringBuilder();
		try {
			StringBuilder urlBuilder = new StringBuilder("https://api.odcloud.kr/api/apnmOrg/v1/list"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("page", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("perPage", "UTF-8") + "="	+ URLEncoder.encode(sendData, "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8") + "=2MQP2Jqoof9NxfXQ8oLwNvYMcm1OdhGVzEgDikf%2BtaB0RSFmbFXey3Jnd5QBanWx4tpWFe6ZUk1j1GO5G%2FDlFQ%3D%3D");
			urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* json타입으로 변환 */

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("content-type", " application/json; charset=UTF-8");
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
		} /* Service Key */

		return sb.toString();
	}

	@RequestMapping(value = "/InsertVaccCenterInfo.do", produces = "application/json;charset=UTF-8;")
	@ResponseBody 
	public int insertVaccCenterInfo(@RequestParam(value = "sendData") String sendData) {
		int result = 0;
		//System.out.println(sendData);
		String dataList[] = sendData.split("&");
		for(int i = 0; i < dataList.length; i++) {
			String realList[] = dataList[i].split("/");
			mediCenterBean.setGubun(1); 				// 예방접종센터는 구분 1
			mediCenterBean.setAddress(realList[0]); 	// 주소
			mediCenterBean.setCenterName(realList[1].substring(6)); // 센터이름
			mediCenterBean.setPhone(realList[2]); 		// 전화번호
			result = mediCenterDao.insertMediCenter(mediCenterBean);				
		}

		return result;
	}

		
	@RequestMapping(value = "/InsertConsignedInstInfo.do", produces = "application/json;charset=UTF-8;")
	@ResponseBody
	public int insertConsignedInstInfo(@RequestParam(value = "sendData") String sendData) {
		int result = 0;
		//System.out.println(sendData);
		String dataList[] = sendData.split("\\$");
		for(int i = 0; i < dataList.length; i++) {
			String realList[] = dataList[i].split("\\^");
			mediCenterBean.setGubun(2);					// 위탁 의료기관은 구분 2
			mediCenterBean.setAddress(realList[0]); 	// 주소
			mediCenterBean.setCenterName(realList[1]); 	// 병원이름
			mediCenterBean.setPhone(realList[2]); 		// 전화번호
			result = mediCenterDao.insertMediCenter(mediCenterBean);
		}

		return result;
	}


}