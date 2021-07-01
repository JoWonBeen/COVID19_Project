<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
<script src="js/reserve_modify.js" defer></script>      
<body>
<div id="largeBox">
	<div class="formBox">
		<h2>예약페이지</h2>
		<form action="ReserveModify.do" id="reserveForm" method="POST">
			<table>
				<colgroup>
					<col style="width: 200px">
					<col style="width: 800px">
				</colgroup>
				<tbody>
					<tr>
						<th>성명</th>
						<td><input type="text" name="name" id="userName" value="${loggedMemberInfo.name }  " readonly style="width:200px;"></td>
					</tr>
					<tr>
						<th>ID</th>
						<td><input type="text" name="id" id="userId" value="${loggedMemberInfo.id }" readonly style="width:200px;"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
						<input type="text" name="birth" id="birth" value="${loggedMemberInfo.birth }" readonly style="width:200px;">
						</td>
					</tr>
					<tr>
						<th>폰번호</th>
						<td><input type="text" name="phone" id="userphone" value="${loggedMemberInfo.phone }" readonly style="width:200px;"></td>
					</tr>
					<tr>
						<th>예약 대상자 구분</th>
						<td>
						<select name="gubun" id = "gubun">
						
						</select>
						</td>
					</tr>
					<tr>
						<th>의료기관 선택</th>
						<td>
						<select name="sido" id = "mainArea" onChange="changeCategory(); resetHospital();">
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
						<select name="sigungu" id = "detailArea" onChange="resetHospital();">
							
						</select>
						<input type="text" name="roadName" id="roadName" onkeyup="choiceHospital(this)" placeholder = "ex)중부대로" style="width:200px;">
						<select name="hospital" id = "hospital">
						</select>
						</td>
					</tr>
					<tr>
						<th>예약 대상 백신</th>
						<td>
						<select name="vaccine" id = "vaccine">
						
						</select>
						</td>
					</tr>
					<tr>
						<th class="dateBox">예약일시</th>
						<td>
						<span class="material-icons">event_available</span>
						<input type="text" id="datepicker" name = "date" style="width:200px;">
						<select name="hour" id = "hour">
						<option>09</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
						<option>13</option>
						<option>14</option>
						<option>15</option>
						<option>16</option>
						<option>17</option>
						<option>18</option>
						</select><span>시</span>
						<select name="minute" id="minute">
						<option>00</option>
						<option>15</option>
						<option>30</option>
						<option>45</option>
						</select><span>분</span>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" value="${loggedMemberInfo.id}" name = "loggedMemberId">
				<input type="submit" value="확인" id="reserve"> 
				<input type="reset" value="취소" id="cancel">
			</div>
		</form>
	</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>












