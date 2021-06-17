<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="css/reservation.css">
<link rel="stylesheet" href="css/reset.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<body>
	<div class="formBox" id="list">
		<h2>예약취소</h2>
		<form action="ReserveDelete.do" method="POST">
		<table>
			<colgroup>
				<col style="width: 300px">
			</colgroup>
			<thead>
				<tr>
					<th>비밀번호</th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td><input type="text"></td>
					</tr>
			</tbody>
		</table>
		<div class="btns">
				<input type="hidden" value="${loggedMemberInfo.id}" name = "loggedMemberId">
				<input type="submit" value="확인" id="reserve"> 
			</div>
			</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>








