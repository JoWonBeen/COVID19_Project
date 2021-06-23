<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<body>
	<div class="formBox">
		<h2>회원가입</h2>
		<form action="MemberJoin.do?type=1" id="joinForm" method="POST">
			<table>
				<colgroup>
					<col style="width: 150px">
					<col style="width: 850px">
				</colgroup>
				<tbody>
					<tr>
						<th>ID</th>
						<td><input type="text" name="id" id="userID">
							<button id="memberIdCheck">중복확인</button></td>
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
<<<<<<< HEAD
						<th>PW-CHECK</th>
						<td><input type="password" name="checkPassword" id="checkPassword"></td>
					</tr>
					<tr>
						<th>Birth</th>
						<td><input type="text" name="birth" id="userBirth" onkeyup="birthFormat(this)" maxlength = "6" placeholder = "ex)950101"></td>
=======
						<th>Birth</th>
						<td><input type="text" name="birth" id="userBirth"></td>
					</tr>
					<tr>
						<th>AGE</th>
						<td><input type="text" name="age" id="userAge"></td>
>>>>>>> JangHyeRim
					</tr>
					<tr>
						<th>GENDER</th>
						<td>
							<select name="gender" id="gender">
									<option value="남">남자</option>
									<option value="여">여자</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>PHONE</th>
						<td><input type="text" name="phone" value="" id="userPhone"></td>
					</tr>
	
				</tbody>
			</table>
			<div class="btns">
				<input type="button" value="회원가입" id="memberJoin">
				<input type="reset" value="취소" id="cancel"> 
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>