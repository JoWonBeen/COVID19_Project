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
		<h2>예약조회</h2>
		<form action="" method="GET">
		<table>
			<colgroup>
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 200px">
				<col style="width: 350px">
				<col style="width: 150px">
				<col style="width: 200px">
				<col style="width: 200px">
				
			</colgroup>
			<thead>
				<tr>
					<th>ID</th>
					<th>성명</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>핸드폰번호</th>
					<th>예약대상자</th>
					<th>백신</th>
					<th>의료기관</th>
					<th>예약일시</th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td>${loggedMemberInfo.id}</td>
						<td>${loggedMemberInfo.name}</td>
						<td>${loggedMemberInfo.birth}</td>
						<td>${loggedMemberInfo.gender}</td>
						<td>${loggedMemberInfo.phone}</td>
						<td>${reserveBean.gubun}</td>
						<td>${reserveBean.vaccine}</td>
						<td>${reserveBean.hospitalAdd}</td>
						<td>${reserveBean.rsDate}</td>
					</tr>
			</tbody>
		</table>
		<div class="btns">
				<input type="hidden" value="${loggedMemberInfo.id}" name = "loggedMemberId">
				<a href="ReserveModifyForm.do">예약수정</a> 
				<a href="ReserveDeleteForm.do">예약취소</a>
			</div>
			</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>








