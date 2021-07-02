<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<body>
	<div id = "memberLoginBox">
	   <div class="formBox">
	   	  <h2>로그인</h2>
	      <form action="MemberLogin.do" id="joinForm" method="POST">
	         <table>
	            <colgroup>
	               <col style="width:150px">
	               <col style="width:500px">
	            </colgroup>
	            <tbody>
	               <tr>
	                  <th>아이디</th>
	                  <td><input type="text" name="id" id="userID"></td>
	               </tr>
	               <tr>
	                  <th style="border: 1px solid #d9d9d9; background-color: #f8f8f8;">비밀번호</th>
	                  <td style="border: 1px solid #d9d9d9; "><input type="password" name="password" id="userPassword"></td>
	               </tr>
	            </tbody>
	         </table>
	         <div class="btns">
	            <input type="submit" value="로그인" id="join" class = "boldFontUse">
	            <a href = "SignUp.do" id = "signUp">회원가입</a>
	         </div>
	      </form>
	   </div>
	</div>
</body>
<%@ include file="../include/footer.jsp"%>