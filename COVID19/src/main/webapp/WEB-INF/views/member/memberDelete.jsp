<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
</head>
<body>

	<div class="formBox" id="update">
		<h2>회원정보 수정</h2>
		<form action="MemberDelete.do" method="POST">
			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody>
				
					<tr>
						<th>ID</th>
						<td>${loggedMemberInfo.id }</td>
					</tr>
					<tr>
						<th>NAME</th>
						<td>${loggedMemberInfo.name }</td>
					</tr>
					
					<tr>
						<th>PASSWORD</th>
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
	<%@ include file="../include/footer.jsp" %>
</body>
</html>






