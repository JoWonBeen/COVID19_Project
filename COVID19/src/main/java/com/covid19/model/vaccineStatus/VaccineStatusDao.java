package com.covid19.model.vaccineStatus;

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
public class VaccineStatusDao {
	
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
	
	public int insertVaccineStatus(VaccineStatusBean vaccineStatusBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertVaccineStatus", vaccineStatusBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

	public String getVaccStatusLastDate() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String lastDate = sqlSession.selectOne("getVaccStatusLastDate");
		sqlSession.close();
		return lastDate;
	}

	public VaccineStatusBean getVaccineMainData(String area) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		VaccineStatusBean vaccineStatusBean = sqlSession.selectOne("getVaccineMainData", area);
		sqlSession.close();
		return vaccineStatusBean;
	}
	
	public List<VaccineStatusBean> getVaccineAreaData() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<VaccineStatusBean> vaccineStatusBean = sqlSession.selectList("getVaccineAreaData");
		sqlSession.close();
		return vaccineStatusBean;
	}
	
		
}
