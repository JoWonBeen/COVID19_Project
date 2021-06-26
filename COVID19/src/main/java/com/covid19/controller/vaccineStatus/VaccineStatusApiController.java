package com.covid19.controller.vaccineStatus;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class VaccineStatusApiController {
	

	@RequestMapping(value = "/VaccineStatusApiCall.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String vaccineStatusApiCall() {
		
		StringBuilder sb = new StringBuilder();
		try {
			StringBuilder urlBuilder = new StringBuilder("https://api.odcloud.kr/api/15077756/v1/vaccine-stat"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("page", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("perPage", "UTF-8") + "="+ URLEncoder.encode("1860", "UTF-8")); /* 한 페이지 결과 수 */
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


//	@RequestMapping("/VaccineStatus.do")
//	public String vaccineStatus() {
//	
//		return "coronaInfo/vaccinationStatus.jsp";
//	}
}		

//urlBuilder.append("&" + URLEncoder.encode("cond[sido::EQ]","UTF-8") + "=" + URLEncoder.encode("전국", "UTF-8")); /*City name*/
//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::EQ]","UTF-8") + "=" + URLEncoder.encode("2021.03.10 24:00:00", "UTF-8")); /*Statistics base date*/
//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::LT]","UTF-8") + "=" + URLEncoder.encode("2021.03.10 24:00:00", "UTF-8")); /*Statistics base date*/
//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::LTE]","UTF-8") + "=" + URLEncoder.encode("2021.03.10 24:00:00", "UTF-8")); /*Statistics base date*/
//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::GT]","UTF-8") + "=" + URLEncoder.encode("2021.03.10 24:00:00", "UTF-8")); /*Statistics base date*/
//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::GTE]","UTF-8") + "=" + URLEncoder.encode("2021.03.10 24:00:00", "UTF-8")); /*Statistics base date*/

