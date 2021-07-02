<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<body>
	<div id = "memberJoinBox">
		<div class="formBox">
			<h2>회원가입</h2>
			<form action="MemberJoin.do?type=1" id="joinForm" method="POST">
				<table>
					<colgroup>
						<col style="width: 150px">
						<col style="width: 600px">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" id="userID" maxlength = "8">
							<button id="memberIdCheck">중복확인</button></td>
						</tr>
						<tr>
							<th>성명</th>
							<td><input type="text" name="name" id="userName" value="" maxlength = "7"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="password" id="userPassword" placeholder = "숫자, 문자, 특수문자를 포함한 8자리 이상"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" name="checkPassword" id="checkPassword" placeholder = "숫자, 문자, 특수문자를 포함한 8자리 이상"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><input type="text" name="birth" id="userBirth" onkeyup="birthFormat(this)" maxlength = "6" placeholder = "ex)950101"></td>
						</tr>
						<tr>
							<th>성별</th>
							<td>
								<select name="gender" id="gender">
										<option value="남">남자</option>
										<option value="여">여자</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="phone" value="" id="userPhone" onkeyup="phoneFormat(this)"></td>
						</tr>
		
					</tbody>
				</table>
				<div class="btns">
					<input type="button" value="회원가입" id="memberJoin" class = "boldFontUse">
					<input type="reset" value="취소" id="cancel" class = "boldFontUse"> 
				</div>
			</form>
		</div>
	</div>
</body>
<%@ include file="../include/footer.jsp"%>
