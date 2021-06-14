<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
</head>
<body>
	<div class="formBox" id="update">
		<h2>회원정보 수정</h2>
		<form action="MemberUpdate.do" method="POST">
			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody>
					<c:choose>
						<c:when test="${loggedMemberInfo.type == 1 }">
							<tr>
								<th>NAME</th>
								<td><input type="text" name="name" value="${loggedMemberInfo.name }"></td>
							</tr>
							<tr>
								<th>PASSWORD</th>
								<td><input type="password" name="password" value=""></td>
							</tr>
							<tr>
								<th>AGE</th>
								<td>${loggedMemberInfo.age }</td>
							</tr>
							<tr>
								<th>GENDER</th>
								<td>${loggedMemberInfo.gender}</td>
							</tr>
							<tr>
								<th>PHONE</th>
								<td><input type="text" name="phone" value="${loggedMemberInfo.phone }"></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th>NAME</th>
								<td><input type="text" name="name" value="${loggedMemberInfo.name }"></td>
							</tr>
							<tr>
								<th>PASSWORD</th>
								<td><input type="password" name="password" value=""></td>
							</tr>
							<tr>
								<th>CENTER NAME</th>
								<td><input type="text" name="centerName" value="${loggedMemberInfo.centerName }"></td>
							</tr>
							<tr>
								<th>PHONE</th>
								<td><input type="text" name="phone" value="${loggedMemberInfo.phone }"></td>
							</tr>
						</c:otherwise>
					</c:choose>
		
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" name="no" value="${loggedMemberInfo.no }">
				<input type="hidden" name="type" value="${loggedMemberInfo.type }">	
				<input type="submit" value="회원 정보 수정" id="join">
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>

