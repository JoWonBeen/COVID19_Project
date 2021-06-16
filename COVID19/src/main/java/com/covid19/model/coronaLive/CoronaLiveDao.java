package com.covid19.model.coronaLive;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import com.covid19.model.member.AdminBean;
import com.covid19.model.member.MemberBean;

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
		System.out.println(lastDate);
		return lastDate;
	}
}
