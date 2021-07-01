<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="css/reservation.css">
<link rel="stylesheet" href="css/reset.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


<body>
	<div id="largeBox">
		<div class="formBox">
			<h2>대상자조회</h2>
			<form action="TargetCheck.do" id="pickedForm" method="GET">
				<table>
					<colgroup>
						<col style="width: 200px">
						<col style="width: 800px">
					</colgroup>
					<tbody>
						<tr>
							<th>성명</th>
							<td><input type="text" name="name" id="userName"
								value="${loggedMemberInfo.name }  " readonly></td>
						</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" id="userId"
								value="${loggedMemberInfo.id }" readonly></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><input type="text" name="birth" id="birth"
								value="${loggedMemberInfo.birth }" readonly></td>
						</tr>
						<tr>
							<th>폰번호</th>
							<td><input type="text" name="phone" id="userphone"
								value="${loggedMemberInfo.phone }" readonly></td>
						</tr>
						<tr>
							<th>특수직군 여부</th>
							<td>
							<input type="radio" name="special" id="special" value="yes" style="width:50px;">네 
							<input type="radio" name="special" id="special" value="no" style="width:50px;">아니요
							</td>
						</tr>
						<tr>
							<th>임산부</th>
							<td>
							<input type="radio" name="pragnent" id="pragnent" value="yes" style="width:50px;">네 
							<input type="radio" name="pragnent" id="pragnent" value="no" style="width:50px;">아니요
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btns">
					<input type="button" value="확인" id="check"> <input
						type="reset" value="취소" id="cancel">
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>

	<script>
		$("#check").on("click", function() {
			var special = $("input:radio[name='special']:checked");
			var pragnent = $("input:radio[name='pragnent']:checked");

			if (special.val() == undefined || pragnent.val() == undefined) {
				alert("선택해주세요");
				return;
			} else {
				$("#pickedForm").submit();
			}
		})
	</script>
</body>
</html>