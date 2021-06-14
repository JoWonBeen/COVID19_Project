package com.covid19.model.member;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

@Component
public class MemberDao {
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
	
	public MemberBean getSelectOneMember(int no) {
		MemberBean memberBean = new MemberBean();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		memberBean = sqlSession.selectOne("getSelectOneMember",no);
		sqlSession.close();
		return memberBean;
	}
	
	public AdminBean getSelectOneAdmin(int no) {
		AdminBean adminBean = new AdminBean();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		adminBean = sqlSession.selectOne("getSelectOneAdmin",no);
		sqlSession.close();
		return adminBean;
	}
	
	public int insertMember(MemberBean memberBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertMember", memberBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	public int insertAdmin(AdminBean adminBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertAdmin", adminBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
			
	public MemberBean getLoginMember(MemberBean memberBean) {
		MemberBean loggedMemberInfo = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		loggedMemberInfo = sqlSession.selectOne("getLoginMember", memberBean);

		sqlSession.close();
		return loggedMemberInfo;
	}
	
	public AdminBean getLoginAdmin(AdminBean adminBean) {
		AdminBean loggedAdminInfo = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		loggedAdminInfo = sqlSession.selectOne("getLoginAdmin", adminBean);

		sqlSession.close();
		return loggedAdminInfo;
	}
	
	
	public int updateMember(MemberBean memberBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateMember", memberBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int updateAdmin(AdminBean adminBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateAdmin", adminBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int deleteMember(int no) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteMember", no);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int deleteAdmin(int no) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteAdmin", no);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public String getPasswordMember(int no) {
		String password = "";
		SqlSession sqlSession = sqlSessionFactory.openSession();
		password = sqlSession.selectOne("getPasswordMember", no);
		sqlSession.close();
		return password;
	}
	
	public String getPasswordAdmin(int no) {
		String password = "";
		SqlSession sqlSession = sqlSessionFactory.openSession();
		password = sqlSession.selectOne("getPasswordAdmin", no);
		sqlSession.close();
		return password;
	}
	
	public int MemberIdCheck(String id) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("memberIdCheck", id);
		sqlSession.close();
		return result;
	}
	public int AdminIdCheck(String id) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.selectOne("adminIdCheck", id);
		sqlSession.close();
		return result;
	}
	
}

















