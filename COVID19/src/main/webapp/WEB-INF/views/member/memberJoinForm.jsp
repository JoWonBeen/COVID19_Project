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
						<td><input type="text" name="id" id="userID" maxlength = "8">
						<button id="memberIdCheck">중복확인</button></td>
					</tr>
					<tr>
						<th>NAME</th>
						<td><input type="text" name="name" id="userName" value="" maxlength = "7"></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password" id="userPassword"></td>
					</tr>
					<tr>
						<th>PW-CHECK</th>
						<td><input type="password" name="chPassword" id="checkPassword"></td>
					</tr>
					<tr>
						<th>Birth</th>
						<td><input type="text" name="birth" id="userBirth" onkeyup="birthFormat(this)" maxlength = "6"></td>
					</tr>
					<tr>
						<th>AGE</th>
						<td><input type="text" name="age" id="userAge"></td>
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
						<td><input type="text" name="phone" value="" id="userPhone" onkeyup="phoneFormat(this)"></td>
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