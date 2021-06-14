<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%-- <%@ include file="../include/header.jsp" %> --%>
<link rel="stylesheet" href="css/reservation.css">
<link rel="stylesheet" href="css/reset.css">
<script src="js/jquery-3.6.0.min.js"></script> 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js" defer></script>
<body>
	<div class="formBox">
		<h2>예약페이지</h2>
		<form action="ReserveWrite.do" id="reserveForm" method="POST">
			<table>
				<colgroup>
					<col style="width: 150px">
					<col style="width: 850px">
				</colgroup>
				<tbody>
					<tr>
						<th>성명</th>
						<td><input type="text" name="name" id="userName" value=""></td>
					</tr>
					<tr>
						<th>ID</th>
						<td><input type="text" name="id" id="userId" value=""></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
						<select name="yy" id="year"></select>년 
						<select name="mm" id="month"></select>월 
						<select name="dd" id="day"></select>일
						</td>
					</tr>
					<tr>
						<th>폰번호</th>
						<td><input type="text" name="phone" id="userphone"></td>
					</tr>
					<tr>
						<th>예약 대상자 구분</th>
						<td>
						<select name="gubun">
						<option value="">의료종사자</option>
						<option value="">돌봄종사자(어린이집,유아교사)</option>
						<option value="">사회필수인력(경찰,소방관,해경등)</option>
						<option value="">60~75세 미만의 어르신</option>
						<option value="">군인,군종사자,예비군,민방위</option>
						<option value="">취약시설 입소 및 종사자</option>
						<option value="">만성 신장질환자</option>
						<option value="">일부 지정된 의료기관 종사자</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>예약 대상 백신</th>
						<td>
						<select name="vaccine">
						<option value="">아스트라제네카</option>
						<option value="">얀센</option>
						<option value="">화이자</option>
						<option value="">모더나</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>의료기관 선택</th>
						<td>
						<select name="sido">
						<option value="">서울</option>
						<option value="">부산</option>
						<option value="">대구</option>
						<option value="">인천</option>
						<option value="">광주</option>
						<option value="">대전</option>
						<option value="">울산</option>
						<option value="">세종</option>
						<option value="">경기</option>
						<option value="">강원</option>
						<option value="">충청북도</option>
						<option value="">충청남도</option>
						<option value="">전라북도</option>
						<option value="">전라남도</option>
						<option value="">경상북도</option>
						<option value="">경상남도</option>
						<option value="">제주</option>
						<option value="">인천</option>
						</select>
						<select name="sigungu">
						<option value="">강남구</option>
						<option value="">강동구</option>
						<option value="">강북구</option>
						<option value="">강서구</option>
						<option value="">관악구</option>
						<option value="">광진구</option>
						<option value="">구로구</option>
						<option value="">금천구</option>
						<option value="">노원구</option>
						<option value="">도봉구</option>
						<option value="">동대문구</option>
						<option value="">동작구</option>
						<option value="">마포구</option>
						<option value="">서대문구</option>
						<option value="">서초구</option>
						<option value="">성동구</option>
						<option value="">성북구</option>
						<option value="">송파구</option>
						<option value="">양천구</option>
						<option value="">영등포구</option>
						<option value="">용산구</option>
						<option value="">은평구</option>
						<option value="">종로구</option>
						<option value="">중구</option>
						<option value="">중랑구</option>
						<option value="">부산강서구</option>
						<option value="">부산금정구</option>
						<option value="">남구</option>
						<option value="">동구</option>
						<option value="">동래구</option>
						<option value="">북구</option>
						<option value="">사상구</option>
						<option value="">사하구</option>
						<option value="">서구</option>
						<option value="">수영구</option>
						<option value="">연제구</option>
						<option value="">영도구</option>
						<option value="">부산중구</option>
						<option value="">진구</option>
						<option value="">해운대구</option>
						<option value="">기장군</option>
						<option value="">대구남구</option>
						<option value="">달서구</option>
						<option value="">대구동구</option>
						<option value="">대구북구</option>
						<option value="">대구서구</option>
						<option value="">대구수성구</option>
						<option value="">수영구</option>
						<option value="">수영구</option>
						<option value="">수영구</option>
						<option value="">수영구</option>
						<option value="">수영구</option>
						<option value="">수영구</option>
						<option value="">수영구</option>
						<option value="">수영구</option>
						<option value="">수영구</option>
						<option value="">수영구</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>예약일시</th>
						<td><textarea name="contents" id="summernote"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="submit" value="확인" id="reserve"> <input
					type="reset" value="취소" id="cancel">
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
<script>
$(document).ready(function(){ var now = new Date(); 
var year = now.getFullYear(); 
var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); //년도 selectbox만들기 
for(var i = 1900 ; i <= year ; i++) { $('#year').append('<option value="' + i + '">' + i + '년</option>'); } // 월별 selectbox 만들기 
for(var i=1; i <= 12; i++) { var mm = i > 9 ? i : "0"+i ; $('#month').append('<option value="' + mm + '">' + mm + '월</option>'); } // 일별 selectbox 만들기 
for(var i=1; i <= 31; i++) { var dd = i > 9 ? i : "0"+i ; $('#day').append('<option value="' + dd + '">' + dd+ '일</option>'); } 
$("#year > option[value="+year+"]").attr("selected", "true"); 
$("#month > option[value="+mon+"]").attr("selected", "true"); 
$("#day > option[value="+day+"]").attr("selected", "true"); })
</script>
</body>
</html>












