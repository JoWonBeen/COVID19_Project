package com.covid19.model.reserve;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;


@Component
public class ReserveDao {

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
	public int insertReserve(ReserveBean reserveBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertReserve",reserveBean);
		sqlSession.commit();
		sqlSession.close();
			
		return result;
	}
	public ReserveBean getAllReservation(String memberId) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		ReserveBean reserveBean = sqlSession.selectOne("getAllReservation", memberId);
		sqlSession.close();
		return reserveBean;
	}
	public int updateReserve(ReserveBean reserveBean) {
		int result=0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateReserve",reserveBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	public int deleteReserve(String memberId) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteReserve",memberId);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	public int checkReserve(String memberId) {
		int result=0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("checkReserve", memberId); 
		sqlSession.close();
		return result;
		
	}
	
}
