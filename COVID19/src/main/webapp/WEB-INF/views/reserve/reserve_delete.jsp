<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
<body>
<div id="largeBox">
	<div class="formBox" id="list">
		<h2>예약취소</h2>
		<form action="ReserveDelete.do" method="POST">
		<table>
			<colgroup>
				<col style="width: 200px">
			</colgroup>
			<thead>
				<tr>
					<th>비밀번호</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="password" name = "password"></td>
				</tr>
			</tbody>
		</table>
		<div class="btns">
				<input type="hidden" value="${vaccine }"  name = "vaccine" id="vaccine"> 
				<input type="hidden" value="${hospitalAdd}" name = "hospitalAdd" id="hospitalAdd"> 
				<input type="submit" value="확인" id="reserveDeleteBtn"> 
			</div>
			</form>
	</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>








