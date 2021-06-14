<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<body>
	<div class="formBox">
		<h2>회원가입</h2>
		<form action="AdminJoin.do?type=2" id="joinForm" method="POST">
			<table>
				<colgroup>
					<col style="width: 150px">
					<col style="width: 850px">
				</colgroup>
				<tbody>
					<tr>
						<th>ID</th>
						<td><input type="text" name="id" id="userID">
							<button id="adminIdCheck">중복확인</button>
						</td>
					</tr>
					<tr>
						<th>NAME</th>
						<td><input type="text" name="name" id="userName" value=""></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password" id="userPassword"></td>
					</tr>
					<tr>
						<th>Center Name</th>
						<td><input type="text" name="centerName" id="centerName"></td>	
					</tr>
					<tr>
						<th>PHONE</th>
						<td><input type="text" name="phone" id="userPhone"></td>
					</tr>
	
				</tbody>
			</table>
			<div class="btns">
				<input type="button" value="회원가입" id="adminJoin"> 
				<input type="reset" value="취소" id="cancel"> 
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>