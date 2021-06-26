<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
<body>
	<div id = "memberInfoBox">
		<div class="formBox" id="update">
			<h2>마이페이지</h2>
			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:500px">
				</colgroup>
				<tbody>
					<c:choose>
						<c:when test="${loggedMemberInfo.type == 1 }">
							<tr>
								<th>ID</th>
								<td>${loggedMemberInfo.id }</td>
							</tr>
							<tr>
								<th>NAME</th>
								<td>${loggedMemberInfo.name }</td>
							</tr>
							<tr>
								<th>BIRTH</th>
								<td>${loggedMemberInfo.birth }</td>
							</tr>
							<tr>
								<th>GENDER</th>
								<td>${loggedMemberInfo.gender}</td>
							</tr>
							<tr>
								<th>PHONE</th>
								<td>${loggedMemberInfo.phone }</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th>ID</th>
								<td>${loggedMemberInfo.id }</td>
							</tr>
							<tr>
								<th>NAME</th>
								<td>${loggedMemberInfo.name }</td>
							</tr>
							
							<tr>
								<th>CENTER NAME</th>
								<td>${loggedMemberInfo.centerName }</td>
							</tr>
							<tr>
								<th>PHONE</th>
								<td>${loggedMemberInfo.phone }</td>
							</tr>
						</c:otherwise>
					</c:choose>
		
				</tbody>
			</table>
			<div class="btns">
				<a href="MemberUpdateForm.do?no=${loggedMemberInfo.no }">회원 수정</a>
				<a href="MemberDeleteForm.do?no=${loggedMemberInfo.no }">회원 탈퇴</a>
			</div>
		</div>
	</div>
</body>
<%@ include file="../include/footer.jsp" %>







