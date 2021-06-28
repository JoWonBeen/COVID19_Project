package com.covid19.controller.vaccineStatus;

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

import com.covid19.model.vaccineStatus.VaccineStatusBean;
import com.covid19.model.vaccineStatus.VaccineStatusDao;

@Controller
public class VaccineStatusApiController {
	
	@Autowired
	VaccineStatusBean vaccineStatusBean;
	
	@Autowired
	VaccineStatusDao vaccineStatusDao;
	

	@RequestMapping(value = "/VaccineStatusApiCall.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String vaccineStatusApiCall(String baseDate) {
		
		StringBuilder sb = new StringBuilder();
		try {
			StringBuilder urlBuilder = new StringBuilder("https://api.odcloud.kr/api/15077756/v1/vaccine-stat"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("page", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("perPage", "UTF-8") + "="+ URLEncoder.encode("1968", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8") + "=2MQP2Jqoof9NxfXQ8oLwNvYMcm1OdhGVzEgDikf%2BtaB0RSFmbFXey3Jnd5QBanWx4tpWFe6ZUk1j1GO5G%2FDlFQ%3D%3D");
			urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* json타입으로 변환 */
			//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::EQ]","UTF-8") + "=" + URLEncoder.encode("2021.03.10 00:00:00", "UTF-8")); /*Statistics base date*/
			//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::LT]","UTF-8") + "=" + URLEncoder.encode("2021.03.10 00:00:00", "UTF-8")); /*Statistics base date*/
			//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::LTE]","UTF-8") + "=" + URLEncoder.encode("2021.03.10 00:00:00", "UTF-8")); /*Statistics base date*/
			//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::GT]","UTF-8") + "=" + URLEncoder.encode("2021.06.26 00:00:00", "UTF-8")); /*Statistics base date*/
			urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::GTE]","UTF-8") + "=" + URLEncoder.encode("2021-03-11 00:00:00", "UTF-8")); /*Statistics base date*/
			//urlBuilder.append("&" + URLEncoder.encode("cond[sido::EQ]","UTF-8") + "=" + URLEncoder.encode("전국", "UTF-8")); /*City name*/


			
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


	@RequestMapping(value="/InsertVaccineInfo.do",produces="application/json;charset=UTF-8;")
	@ResponseBody 
	public int insertVaccineInfo(@RequestParam(value="dataList") String dataList) {
		int result = 0;
		String[] dataList1 = dataList.split("&");
		for(int i = 0; i < dataList1.length; i++) {
			String[] dataList2 = dataList1[i].split("/");
			
			vaccineStatusBean.setBaseDate(dataList2[0]);
			vaccineStatusBean.setArea((dataList2[1]));
			vaccineStatusBean.setFirstCnt(Integer.parseInt(dataList2[2]));
			vaccineStatusBean.setSecondCnt(Integer.parseInt(dataList2[3]));
			vaccineStatusBean.setTotalFirstCnt(Integer.parseInt(dataList2[4]));
			vaccineStatusBean.setTotalSecondCnt(Integer.parseInt(dataList2[5]));
			result = vaccineStatusDao.insertVaccineStatus(vaccineStatusBean);
		}

		return result;
	}
	
	@RequestMapping(value="/GetVaccStatusLastDate.do",produces="application/json;charset=UTF-8;")
	@ResponseBody
	public String getLastDate() {
		String lastDate = vaccineStatusDao.getVaccStatusLastDate();
		return lastDate;
	}	
}

//urlBuilder.append("&" + URLEncoder.encode("cond[sido::EQ]","UTF-8") + "=" + URLEncoder.encode("전국", "UTF-8")); /*City name*/
//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::EQ]","UTF-8") + "=" + URLEncoder.encode("2021.03.10 24:00:00", "UTF-8")); /*Statistics base date*/
//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::LT]","UTF-8") + "=" + URLEncoder.encode("2021.03.10 24:00:00", "UTF-8")); /*Statistics base date*/
//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::LTE]","UTF-8") + "=" + URLEncoder.encode("2021.03.10 24:00:00", "UTF-8")); /*Statistics base date*/
//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::GT]","UTF-8") + "=" + URLEncoder.encode("2021.03.10 24:00:00", "UTF-8")); /*Statistics base date*/
//urlBuilder.append("&" + URLEncoder.encode("cond[baseDate::GTE]","UTF-8") + "=" + URLEncoder.encode("2021.03.10 24:00:00", "UTF-8")); /*Statistics base date*/

