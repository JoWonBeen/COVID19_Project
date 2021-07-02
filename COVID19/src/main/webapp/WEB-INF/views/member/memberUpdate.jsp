<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
<body>
	<div id = "memberInfoUpdateBox">
		<div class="formBox" id="update">
			<h2>회원정보 수정</h2>
			<form action="MemberUpdate.do" method="POST">
				<table>
					<colgroup>
						<col style="width:150px">
						<col style="width:600px">
					</colgroup>
					<tbody>
						<c:choose>
							<c:when test="${loggedMemberInfo.type == 1 }">
								<tr>
									<th>아이디</th>
									<td><input type="text" name="id" value="${loggedMemberInfo.id }" readonly></td>
								</tr>
								<tr>
									<th>성명</th>
									<td><input type="text" name="name" value="${loggedMemberInfo.name }"></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="password" name="password" value="" placeholder = "비밀번호를 입력해주세요."></td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td><input type="text" name="birth" value="${loggedMemberInfo.birth }" readonly></td>
								</tr>
								<tr>
									<th>성별</th>
									<td><input type="gender" name="gender" value="${loggedMemberInfo.gender }" readonly></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" name="phone" value="${loggedMemberInfo.phone }" onkeyup="phoneFormat(this)"></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th>아이디</th>
									<td><input type="text" name="id" value="${loggedMemberInfo.id }" readonly></td>
								</tr>
								
								<tr>
									<th>성명</th>
									<td><input type="text" name="name" value="${loggedMemberInfo.name }" maxlength = "7"></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="password" name="password" value=""></td>
								</tr>
								<tr>
									<th>의료센터 이름</th>
									<td><input type="text" name="centerName" value="${loggedMemberInfo.centerName }"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" name="phone" value="${loggedMemberInfo.phone }" onkeyup="phoneFormat(this)"></td>
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
	</div>
</body>
<%@ include file="../include/footer.jsp" %>

