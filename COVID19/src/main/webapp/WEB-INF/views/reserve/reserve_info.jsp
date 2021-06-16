<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%-- <%@ include file="../include/header.jsp" %> --%>
<link rel="stylesheet" href="css/reservation.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/calendar.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
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
						<td>${loggedMemberInfo.name }</td>
					</tr>
					<tr>
						<th>ID</th>
						<td>${loggedMemberInfo.id }</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${loggedMemberInfo.birth }</td>
					</tr>
					<tr>
						<th>폰번호</th>
						<td>${loggedMemberInfo.phone }</td>
					</tr>
					<tr>
						<th>예약 대상자 구분</th>
						<td></td>
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
						<option value="">강서구</option>
						<option value="">금정구</option>
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
						<option value="">중구</option>
						<option value="">진구</option>
						<option value="">해운대구</option>
						<option value="">기장군</option>
						<option value="">남구</option>
						<option value="">달서구</option>
						<option value="">동구</option>
						<option value="">북구</option>
						<option value="">서구</option>
						<option value="">중구</option>
						<option value="">동구</option>
						<option value="">남구</option>
						<option value="">미추홀구</option>
						<option value="">연수구</option>
						<option value="">남동구</option>
						<option value="">북구</option>
						<option value="">부평구</option>
						<option value="">계양구</option>
						<option value="">서구</option>
						<option value="">강화군</option>
						<option value="">옹진군</option>
						<option value="">동구</option>
						<option value="">서구</option>
						<option value="">남구</option>
						<option value="">북구</option>
						<option value="">광산구</option>
						<option value="">동구</option>
						<option value="">중구</option>
						<option value="">서구</option>
						<option value="">유성구</option>
						<option value="">대덕구</option>
						<option value="">중구</option>
						<option value="">남구</option>
						<option value="">동구</option>
						<option value="">북구</option>
						<option value="">울주군</option>
						<option value="">세종시</option>
						<option value="">수원시</option>
						<option value="">장안구</option>
						<option value="">권선구</option>
						<option value="">팔달구</option>
						<option value="">영통구</option>
						<option value="">성남시</option>
						<option value="">수정구</option>
						<option value="">중원구</option>
						<option value="">분당구</option>
						<option value="">의정부시</option>
						<option value="">안양시</option>
						<option value="">만안구</option>
						<option value="">동안구</option>
						<option value="">부천시</option>
						<option value="">원미구</option>
						<option value="">소사구</option>
						<option value="">오정구</option>
						<option value="">광명시</option>
						<option value="">평택시</option>
						<option value="">송탄시</option>
						<option value="">동두천시</option>
						<option value="">안산시</option>
						<option value="">상록구</option>
						<option value="">단원구</option>
						<option value="">고양시</option>
						<option value="">덕양구</option>
						<option value="">일산구</option>
						<option value="">일산동구</option>
						<option value="">일산서구</option>
						<option value="">과천시</option>
						<option value="">구리시</option>
						<option value="">미금시</option>
						<option value="">남양주시</option>
						<option value="">오산시</option>
						<option value="">시흥시</option>
						<option value="">군포시</option>
						<option value="">의왕시</option>
						<option value="">하남시</option>
						<option value="">용인시</option>
						<option value="">처인구</option>
						<option value="">기흥구</option>
						<option value="">수지구</option>
						<option value="">파주시</option>
						<option value="">이천시</option>
						<option value="">안성시</option>
						<option value="">김포시</option>
						<option value="">화성시</option>
						<option value="">광주시</option>
						<option value="">양주시</option>
						<option value="">포천시</option>
						<option value="">여주시</option>
						<option value="">춘천시</option>
						<option value="">원주시</option>
						<option value="">강릉시</option>
						<option value="">동해시</option>
						<option value="">태백시</option>
						<option value="">속초시</option>
						<option value="">삼척시</option>
						<option value="">춘천군</option>
						<option value="">홍천군</option>
						<option value="">횡성군</option>
						<option value="">원주군</option>
						<option value="">영월군</option>
						<option value="">평창군</option>
						<option value="">정선군</option>
						<option value="">철원군</option>
						<option value="">화천군</option>
						<option value="">양구군</option>
						<option value="">인제군</option>
						<option value="">고성군</option>
						<option value="">양양군</option>
						<option value="">명주군</option>
						<option value="">삼척군</option>
						<option value="">청주시</option>
						<option value="">서원구</option>
						<option value="">청원구</option>
						<option value="">상당구</option>
						<option value="">홍덕구</option>
						<option value="">충주시</option>
						<option value="">제천시</option>
						<option value="">청원군</option>
						<option value="">보은군</option>
						<option value="">옥천군</option>
						<option value="">영동군</option>
						<option value="">증평군</option>
						<option value="">진천군</option>
						<option value="">괴산군</option>
						<option value="">음성군</option>
						<option value="">중원군</option>
						<option value="">제천군</option>
						<option value="">단양군</option>
						<option value="">당진시</option>
						<option value="">천안시</option>
						<option value="">동남구</option>
						<option value="">서북구</option>
						<option value="">공주시</option>
						<option value="">대천시</option>
						<option value="">보령시</option>
						<option value="">온양시</option>
						<option value="">아산시</option>
						<option value="">서산시</option>
						<option value="">논산시</option>
						<option value="">계룡시</option>
						<option value="">금산군</option>
						<option value="">연기군</option>
						<option value="">전주시</option>
						<option value="">완산구</option>
						<option value="">덕진구</option>
						<option value="">군산시</option>
						<option value="">익산시</option>
						<option value="">정읍시</option>
						<option value="">남원시</option>
						<option value="">완주군</option>
						<option value="">진안군</option>
						<option value="">무주군</option>
						<option value="">장수군</option>
						<option value="">임실군</option>
						<option value="">남원군</option>
						<option value="">순창군</option>
						<option value="">정읍군</option>
						<option value="">고창군</option>
						<option value="">부안군</option>
						<option value="">짐제군</option>
						<option value="">옥구군</option>
						<option value="">익산군</option>
						<option value="">목포시</option>
						<option value="">여수시</option>
						<option value="">순천시</option>
						<option value="">나주시</option>
						<option value="">여천시</option>
						<option value="">동광양시</option>
						<option value="">광양시</option>
						<option value="">담양군</option>
						<option value="">곡성군</option>
						<option value="">구례군</option>
						<option value="">광양군</option>
						<option value="">여천군</option>
						<option value="">승주군</option>
						<option value="">고흥군</option>
						<option value="">보성군</option>
						<option value="">화순군</option>
						<option value="">장흥군</option>
						<option value="">강진군</option>
						<option value="">해남군</option>
						<option value="">영암군</option>
						<option value="">무안군</option>
						<option value="">나주군</option>
						<option value="">함평군</option>
						<option value="">영광군</option>
						<option value="">장성군</option>
						<option value="">완도군</option>
						<option value="">진도군</option>
						<option value="">신안군</option>
						<option value="">광양군</option>
						<option value="">포항시</option>
						<option value="">남구</option>
						<option value="">북구</option>
						<option value="">경주시</option>
						<option value="">김천시</option>
						<option value="">안동시</option>
						<option value="">구미시</option>
						<option value="">영주시</option>
						<option value="">영천시</option>
						<option value="">상주시</option>
						<option value="">점촌시</option>
						<option value="">문경시</option>
						<option value="">경산시</option>
						<option value="">달성군</option>
						<option value="">군위군</option>
						<option value="">의성군</option>
						<option value="">안동군</option>
						<option value="">청송군</option>
						<option value="">영양군</option>
						<option value="">영덕군</option>
						<option value="">경주군</option>
						<option value="">영천군</option>
						<option value="">경산군</option>
						<option value="">청도군</option>
						<option value="">고령군</option>
						<option value="">성주군</option>
						<option value="">칠곡군</option>
						<option value="">금릉군</option>
						<option value="">선산군</option>
						<option value="">상주군</option>
						<option value="">문경군</option>
						<option value="">예천군</option>
						<option value="">영풍군</option>
						<option value="">봉화군</option>
						<option value="">울진군</option>
						<option value="">울릉군</option>
						<option value="">창원시</option>
						<option value="">의창구</option>
						<option value="">성산구</option>
						<option value="">마산합포구</option>
						<option value="">마산회원구</option>
						<option value="">진해구</option>
						<option value="">창원시</option>
						<option value="">울산시</option>
						<option value="">합포구</option>
						<option value="">회원구</option>
						<option value="">마산시</option>
						<option value="">진주시</option>
						<option value="">진해시</option>
						<option value="">충무시</option>
						<option value="">통영시</option>
						<option value="">삼천포시</option>
						<option value="">사천시</option>
						<option value="">김해시</option>
						<option value="">밀양시</option>
						<option value="">장승포시</option>
						<option value="">거제시</option>
						<option value="">양산시</option>
						<option value="">울산군</option>
						<option value="">김해군</option>
						<option value="">창원군</option>
						<option value="">통영군</option>
						<option value="">거제군</option>
						<option value="">고성군</option>
						<option value="">사천군</option>
						<option value="">남해군</option>
						<option value="">하동군</option>
						<option value="">산청군</option>
						<option value="">함안군</option>
						<option value="">거창군</option>
						<option value="">합천군</option>
						<option value="">제주시</option>
						<option value="">서귀포시</option>
						<option value="">북제주군</option>
						<option value="">남제주군</option>
						</select>
						<select name="hospital">
						<option value="">서울병원</option>
						<option value="">부산병원</option>
						<option value="">인천병원</option>
						<option value="">대전병원</option>
						<option value="">대구병원</option>
						<option value="">경기병원</option>
						<option value="">충청병원</option>
						<option value="">전남병원</option>
						<option value="">전북병원</option>
						<option value="">충북병원</option>
						<option value="">광주병원</option>
						<option value="">제주병원</option>
						</select>
						</td>
					</tr>
					<tr>
						<th class="dateBox">예약일시</th>
						<td>
						<a href="Calendar.do"><span class="material-icons">event_available</span></a>
						<input type="text" name="date" id="date" value="">
						<select name="hour">
						<option value="">09</option>
						<option value="">10</option>
						<option value="">11</option>
						<option value="">12</option>
						<option value="">13</option>
						<option value="">14</option>
						<option value="">15</option>
						<option value="">16</option>
						<option value="">17</option>
						<option value="">18</option>
						</select><span>시</span>
						<select name="minute">
						<option value="">00</option>
						<option value="">15</option>
						<option value="">30</option>
						<option value="">45</option>
						</select><span>분</span>
						</td>
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












