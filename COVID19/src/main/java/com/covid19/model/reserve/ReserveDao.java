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
	public List<ReserveBean> getAllReservation(int start, int end) {
		Map<String,Integer> page = new HashMap<String,Integer>();
		page.put("start", start);
		page.put("end", end);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ReserveBean> ReservationList = sqlSession.selectList("getAllReservation", page);
		sqlSession.close();
		return ReservationList;
	}
	public ReserveBean getSelectOneReserve(int no) {
		ReserveBean reserveBean = new ReserveBean();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		reserveBean = sqlSession.selectOne("getSelectOneBoard", no);
		sqlSession.close();
		return reserveBean;
	}
	public int getTotal() {
		int total = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		total = sqlSession.selectOne("getTotal");
		sqlSession.close();
		return total;
	}
}
