<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<body>
	<div id = "adminJoinBox">
		<div class="formBox">
			<h2>회원가입</h2>
			<form action="AdminJoin.do?type=2" id="joinForm" method="POST">
				<table>
					<colgroup>
						<col style="width: 200px">
						<col style="width: 850px">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" id="userID" maxlength = "10">
								<button id="adminIdCheck">중복확인</button>
							</td>
						</tr>
						<tr>
							<th>성명</th>
							<td><input type="text" name="name" id="userName" value=""maxlength = "8"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="password" id="userPassword" maxlength = "12" placeholder = "숫자, 문자, 특수문자를 포함한 8자리 이상"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" name="checkPassword" id="checkPassword" placeholder = "숫자, 문자, 특수문자를 포함한 8자리 이상"></td>
						</tr>
						<tr>
							<th>의료센터 이름</th>
							<td>
								<select name="mainArea" id = "mainArea" onChange="changeAddressCategory(); resetHospital();">
									<option selected="selected">선택하세요</option>
									<option>서울특별시</option>
									<option>부산광역시</option>
									<option>대구광역시</option>
									<option>인천광역시</option>
									<option>광주광역시</option>
									<option>대전광역시</option>
									<option>울산광역시</option>
									<option>세종시</option>
									<option>경기도</option>
									<option>강원도</option>
									<option>충청북도</option>
									<option>충청남도</option>
									<option>전라북도</option>
									<option>전라남도</option>
									<option>경상북도</option>
									<option>경상남도</option>
									<option>제주도</option>
								</select>
								<select name="detailArea" id = "detailArea" onChange = "resetHospital();">
									<option selected="selected">선택하세요</option>
								</select>
								<input type="text" name="roadName" id="roadName" onkeyup="choiceHospital(this)" placeholder = "ex)중부대로">
								<select name="hospital" id = "hospital">
									<option selected="selected">선택하세요</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="phone" id="userPhone" placeholder = "ex)010-1234-5678"></td>
						</tr>
		
					</tbody>
				</table>
				<div class="btns">
					<input type="button" value="회원가입" id="adminJoin" class = "boldFontUse"> 
					<input type="reset" value="취소" id="cancel" class = "boldFontUse"> 
				</div>
			</form>
		</div>
	</div>
</body>
<%@ include file="../include/footer.jsp"%>
