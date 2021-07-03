<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<body>
	<div id="vaccineReserveListBox">
		<div class="formBox" id="list">
			<h2>백신 예약내역 조회</h2>
			<form action="" method="GET">
				<table>
					<colgroup>
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 200px">
						<col style="width: 250px">
						<col style="width: 350px">
						<col style="width: 100px">
						<col style="width: 200px">
					</colgroup>
					<thead>

						<tr>
							<th>예약번호</th>
							<th>아이디</th>
							<th>성명</th>
							<th>생년월일</th>
							<th>성별</th>
							<th>핸드폰번호</th>
							<th>예약대상자</th>
							<th>백신</th>
							<th>예약일시</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="reserveContent" items="${reserveList }"
							varStatus="reserveNo">
							<tr>
								<td>${reserveNo.count}</td>
								<td>${reserveContent.memberId}</td>
								<td>${reserveContent.name}</td>
								<td>${reserveContent.birth}</td>
								<td>${reserveContent.gender}</td>
								<td>${reserveContent.phone}</td>
								<td>${reserveContent.gubun}</td>
								<td>${reserveContent.vaccine}</td>
								<td>${reserveContent.rsDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>