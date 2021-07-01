<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<body>
	<div id = "vaccineReservationBox">
		<div class="formBox">
			<h2>${loggedMemberInfo.centerName }</h2>
			<form action="UpdateCenterVaccineInfo.do" id="joinForm" method="POST">
				<table>
					<colgroup>
						<col style="width:150px">
						<col style="width:850px">
					</colgroup>
					<tbody>
						<tr>
							<th>화이자</th>
							<td>
								<label>보유량 : </label>
								<input type="text" name="vaccineType" id="pfizer" value="${centerVaccineInfoBeanList[0].vaccineCnt }">
								<button class = "up"><span class="material-icons">arrow_upward</span></button>
								<button class = "down"><span class="material-icons">arrow_downward</span></button>
								<br><label>소모량 : </label>
								<input type="text" name="useVaccine" class="useVaccine" value="0">
								<button class = "use"><span class="material-icons">remove</span></button>
								<br><label>입고량 : </label>
								<input type="text" name="addVaccine" class="addVaccine" value="0">
								<button class = "add"><span class="material-icons">add</span></button>
							</td>
						</tr>
						<tr>
							<th>아스트라제네카</th>
							<td>
								<label>보유량 : </label>
								<input type="text" name="vaccineType" id="astrazeneca" value="${centerVaccineInfoBeanList[1].vaccineCnt }">					
								<button class = "up"><span class="material-icons">arrow_upward</span></button>
								<button class = "down"><span class="material-icons">arrow_downward</span></button>
								<br><label>소모량 : </label>
								<input type="text" name="useVaccine" class="useVaccine" value="0">
								<button class = "use"><span class="material-icons">remove</span></button>
								<br><label>입고량 : </label>
								<input type="text" name="addVaccine" class="addVaccine" value="0">
								<button class = "add"><span class="material-icons">add</span></button>
							</td>
						</tr>
						<tr>
							<th>얀센</th>
							<td>
								<label>보유량 : </label>
								<input type="text" name="vaccineType" id="janssen" value="${centerVaccineInfoBeanList[2].vaccineCnt }">
								<button class = "up"><span class="material-icons">arrow_upward</span></button>
								<button class = "down"><span class="material-icons">arrow_downward</span></button>
								<br><label>소모량 : </label>
								<input type="text" name="useVaccine" class="useVaccine" value="0">
								<button class = "use"><span class="material-icons">remove</span></button>
								<br><label>입고량 : </label>
								<input type="text" name="addVaccine" class="addVaccine" value="0">
								<button class = "add"><span class="material-icons">add</span></button>
							</td>
						</tr>
						<tr>
							<th>모더나</th>
							<td>
								<label>보유량 : </label>
								<input type="text" name="vaccineType" id="moderna" value="${centerVaccineInfoBeanList[3].vaccineCnt }">
								<button class = "up"><span class="material-icons">arrow_upward</span></button>
								<button class = "down"><span class="material-icons">arrow_downward</span></button>
								<br><label>소모량 : </label>
								<input type="text" name="useVaccine" class="useVaccine" value="0">
								<button class = "use"><span class="material-icons">remove</span></button>
								<br><label>입고량 : </label>
								<input type="text" name="addVaccine" class="addVaccine" value="0">
								<button class = "add"><span class="material-icons">add</span></button>
							</td>
						</tr>
						
					</tbody>
				</table>
				<div class="btns">
	<!-- 				<input type="button" value="수량등록" id="join"> -->
					<input type="submit" value="수량등록" id="join">
				</div>
			</form>
		</div>
	</div>
</body>
</html>