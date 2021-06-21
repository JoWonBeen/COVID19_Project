package com.covid19.model.mediCenter;

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
	
	public List<MediCenterBean> showAllCenter(String sido, String sigungu) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<String, Object> option = new HashMap<String, Object>();
		option.put("sido", sido);
		option.put("sigungu", sigungu);
		List<MediCenterBean> mediCenterList = sqlSession.selectList("showAllCenter", option);
		sqlSession.close();
		return mediCenterList;
	}
	public List<MediCenterBean> showClassifiedCenter(int gubun, String sido, String sigungu) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<String, Object> option = new HashMap<String, Object>();
		option.put("gubun", gubun);
		option.put("sido", sido);
		option.put("sigungu", sigungu);
		List<MediCenterBean> mediCenterList = sqlSession.selectList("showClassifiedCenter", option);
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
		

	

}
