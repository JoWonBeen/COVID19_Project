package com.covid19.model.coronaLive;

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
public class CoronaLiveDao {
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
	
	public int insertCoronaDateInfo(CoronaDateInfoBean coronaDateInfoBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertCoronaDateInfo", coronaDateInfoBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public String getLastDate() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String lastDate = sqlSession.selectOne("getLastDate");
		sqlSession.close();
		return lastDate;
	}
	
	
	public int insertCoronaDateInfoSido(CoronaSidoInfoBean coronaSidoInfoBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertCoronaDateInfoSido", coronaSidoInfoBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	public String getLastDateSido() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String lastDate = sqlSession.selectOne("getLastDateSido");
		sqlSession.close();
		return lastDate;
	}
	
	public List<CoronaDateInfoBean> getAllAreaData(int type, String period) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<String, Object> dateOption = new HashMap<String, Object>();
		dateOption.put("type", type);
		dateOption.put("period", period);
		List<CoronaDateInfoBean> coronaDateInfoBeanList = sqlSession.selectList("getAllAreaData", dateOption);
		sqlSession.close();
		return coronaDateInfoBeanList;
	}
	
	public List<CoronaSidoInfoBean> getAreaData(int type, int period, String area) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<String, Object> dateOption = new HashMap<String, Object>();
		dateOption.put("type", type);
		dateOption.put("period", period);
		dateOption.put("area", area);
		List<CoronaSidoInfoBean> coronaSidoInfoBean = sqlSession.selectList("getAreaData", dateOption);
		sqlSession.close();
		return coronaSidoInfoBean;
	}
	
	
	public int updateTodayCnt() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int result = sqlSession.update("updateTodayCnt");
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	public int deleteRepeatDate() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int result = sqlSession.delete("deleteRepeatDate");
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	public int updateTodayCntSido() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int result = sqlSession.update("updateTodayCntSido");
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

}
