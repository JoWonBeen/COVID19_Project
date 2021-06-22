package com.covid19.model.replyBoard;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

@Component
public class ReplyBoardDao {
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

	public List<ReplyBoardBean> getAllBoard(int start, int end) {
		Map<String,Integer> page = new HashMap<String,Integer>();
		page.put("start", start);
		page.put("end", end);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ReplyBoardBean> replyBoardList = sqlSession.selectList("getAllBoard", page);
		sqlSession.close();
		return replyBoardList;
	}
	
	
	public int getMaxRef() {
		int max = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		max = sqlSession.selectOne("getMaxRef");
		sqlSession.close();
		return max;
	}
	
	
	public int insertBoard(ReplyBoardBean replyBoardBean) {
		int result = 0;

		int ref = 0;
		int reStep = 1;
		int reLevel = 1;
		ref = getMaxRef() + 1;
		
		replyBoardBean.setRef(ref);
		replyBoardBean.setReStep(reStep);
		replyBoardBean.setReLevel(reLevel);
		replyBoardBean.setReadCount(0);
		System.out.println(replyBoardBean.toString());
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertBoard",replyBoardBean);
		sqlSession.commit();
		sqlSession.close();
			
		return result;
	}
	
	public int updateReadCount(int no) {
		int readCount = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		readCount = sqlSession.update("updateReadCount",no);
		sqlSession.commit();
		sqlSession.close();
		return readCount;
	}
	
	
	public ReplyBoardBean getSelectOneBoard(int no) {
		ReplyBoardBean replyBoardBean = new ReplyBoardBean();
		updateReadCount(no);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		replyBoardBean = sqlSession.selectOne("getSelectOneBoard", no);

		sqlSession.close();
		return replyBoardBean;
	}
	
	public int deleteBoard(String memberId) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteBoard",memberId);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int updateBoard(String memberId) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateBoard", memberId);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int updateRefAndLevel(ReplyBoardBean replyBoardBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateRefAndLevel",replyBoardBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int rewriteBoard(ReplyBoardBean replyBoardBean) {
		int result = 0;
		int ref = replyBoardBean.getRef();
		int reStep = replyBoardBean.getReStep();
		int reLevel = replyBoardBean.getReLevel();

		updateRefAndLevel(replyBoardBean);
		reStep += 1;
		reLevel+=1;
		replyBoardBean.setRef(ref);
		replyBoardBean.setReStep(reStep);
		replyBoardBean.setReLevel(reLevel);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("rewriteBoard", replyBoardBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
//	public String getPasswordBoard(int no) {
//		String password = "";
//		SqlSession sqlSession = sqlSessionFactory.openSession();
//		password = sqlSession.selectOne("getPasswordBoard",no);
//		sqlSession.close();
//		return password;
//	}
	
	
	public int getTotal() {
		int total = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		total = sqlSession.selectOne("getTotal");
		sqlSession.close();
		return total;
	}
}











