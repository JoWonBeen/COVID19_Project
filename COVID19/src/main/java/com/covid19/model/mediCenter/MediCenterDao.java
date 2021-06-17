package com.covid19.model.mediCenter;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;


@Component
public class MediCenterDao {
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
	
	public List<MediCenterBean> showAllCenter() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<MediCenterBean> mediCenterList = sqlSession.selectList("showAllCenter");
		sqlSession.close();
		return mediCenterList;
	}

	public int insertMediCenter(MediCenterBean mediCenterBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertMediCenter", mediCenterBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
		
	
	
	public String getmediCenterData() {
		return null;
	}
	

}
