package com.covid19.model.CenterAdmin;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

@Component
public class CenterAdminDao {
	private static SqlSessionFactory sqlSessionFactory;

	static {
		try {
			String resource = "com/covid19/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int addCenterVaccineData(String centerName) {		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		result = sqlSession.selectOne("checkCenterNameIsExist",centerName);
		if (result == 0) {
			result = sqlSession.insert("addCenterVaccineDataPfizer",centerName);
			result = sqlSession.insert("addCenterVaccineDataAstrazeneca",centerName);
			result = sqlSession.insert("addCenterVaccineDataJanssen",centerName);
			result = sqlSession.insert("addCenterVaccineDataModerna",centerName);
		}
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	public List<CenterVaccineInfoBean> getCenterVaccineInfo(String centerName) {		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<CenterVaccineInfoBean> centerVaccineInfoBeanList;
		centerVaccineInfoBeanList = sqlSession.selectList("getCenterVaccineInfo",centerName);
		sqlSession.close();
		return centerVaccineInfoBeanList;
	}
	
	public int updateCenterVaccineInfo(String centerName, String vaccineType, String vaccineCnt) {		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		HashMap<String, Object> vaccineInfo = new HashMap<String, Object>();
		vaccineInfo.put("centerName", centerName);
		vaccineInfo.put("vaccineType", vaccineType);
		vaccineInfo.put("vaccineCnt", Integer.parseInt(vaccineCnt));
		result = sqlSession.update("updateCenterVaccineInfo",vaccineInfo);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public List<CenterVaccineReservaionBean> getCenterReserveList(String centerName) {		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<CenterVaccineReservaionBean> reserveList;
		reserveList = sqlSession.selectList("getCenterReserveList",centerName);
		sqlSession.close();
		return reserveList;
	}
}
