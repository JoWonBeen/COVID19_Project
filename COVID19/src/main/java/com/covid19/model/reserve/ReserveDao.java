package com.covid19.model.reserve;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import com.covid19.model.member.MemberBean;

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
	
	public ReserveBean getSelectOneDate(int no) {
		ReserveBean reserveBean = new ReserveBean();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		reserveBean = sqlSession.selectOne("getSelectOneDate",no);
		sqlSession.close();
		return reserveBean;
	}
}
