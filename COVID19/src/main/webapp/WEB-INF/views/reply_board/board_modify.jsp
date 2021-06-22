<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="css/reservation.css">
<link rel="stylesheet" href="css/reset.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<body>
	<div class="formBox">
		<h2>문의하기</h2>
		<form id="joinForm" method="POST" action="BoardModify.do">
			<table>
				<colgroup>
					<col style="width: 200px">
					<col style="width: 1300px">
				</colgroup>
				<tbody>
					<tr>
						<th>NAME</th>
						<td><input type="text" name="name" id="userName" value="${loggedMemberInfo.name}"></td>
					</tr>
					<tr>
						<th>E-MAIL</th>
						<td><input type="text" name="email" id="userEmail" value="${replyBoardBean.email}"></td>
					</tr>
					<tr>
						<th>SUBJECT</th>
						<td><input type="text" name="subject" id="subject" value="${replyBoardBean.subject}"></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password" id="userPassword"></td>
					</tr>
					<tr>
						<th>CONTENTS</th>
						<td><textarea name="contents" id="contents">${replyBoardBean.contents}</textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" value="${loggedMemberInfo.id}" name = "loggedMemberId">
				<input type="submit" value="수정" id="join">
				<a href="BoardList.do">목록</a>
			</div>
		</form>
	</div>
	<script>
	</script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>












