<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
<body>
	<div id = "memberInfoDeleteBox">
		<div class="formBox" id="update">
			<h2>회원탈퇴</h2>
			<form action="MemberDelete.do" method="POST">
				<table>
					<colgroup>
						<col style="width:150px">
						<col style="width:500px">
					</colgroup>
					<tbody>
					
						<tr>
							<th>아이디</th>
							<td>${loggedMemberInfo.id }</td>
						</tr>
						<tr>
							<th>성명</th>
							<td>${loggedMemberInfo.name }</td>
						</tr>
						
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="password" value=""></td>
						</tr>
					</tbody>
				</table>
				<div class="btns">
					<input type="hidden" name="no" value="${loggedMemberInfo.no }">
					<input type="hidden" name="type" value="${loggedMemberInfo.type }">
					<input type="submit" value="회원 탈퇴" id="join">
				</div>
			</form>
		</div>
	</div>
</body>
<%@ include file="../include/footer.jsp" %>






