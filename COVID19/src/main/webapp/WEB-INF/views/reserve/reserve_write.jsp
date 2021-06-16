<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%-- <%@ include file="../include/header.jsp" %> --%>
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
						<td><input type="text" name="name" id="userName" value="${loggedMemberInfo.name }  " readonly></td>
					</tr>
					<tr>
						<th>ID</th>
						<td><input type="text" name="id" id="userId" value="${loggedMemberInfo.id }" readonly></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
						<input type="text" name="birth" id="birth" value="${loggedMemberInfo.birth }" readonly>
						</td>
					</tr>
					<tr>
						<th>폰번호</th>
						<td><input type="text" name="phone" id="userphone" value="${loggedMemberInfo.phone }" readonly></td>
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
						<select name="sido" id = "mainArea" onChange="changeCategory();">
						<option selected="selected">서울</option>
						<option>부산</option>
						<option>대구</option>
						<option>인천</option>
						<option>광주</option>
						<option>대전</option>
						<option>울산</option>
						<option>세종</option>
						<option>경기</option>
						<option>강원</option>
						<option>충청북도</option>
						<option>충청남도</option>
						<option>전라북도</option>
						<option>전라남도</option>
						<option>경상북도</option>
						<option>경상남도</option>
						<option>제주</option>
						<option>인천</option>
						</select>
						<select name="sigungu" id = "detailArea" onChange="changeCategory02();">
<!-- 							<option selected="selected">강남구</option> -->
<!-- 							<option>강동구</option> -->
<!-- 							<option>강북구</option> -->
<!-- 							<option>강서구</option> -->
<!-- 							<option>관악구</option> -->
<!-- 							<option>광진구</option> -->
<!-- 							<option>구로구</option> -->
<!-- 							<option>금천구</option> -->
<!-- 							<option>노원구</option> -->
<!-- 							<option>도봉구</option> -->
<!-- 							<option>동대문구</option> -->
<!-- 							<option>동작구</option> -->
<!-- 							<option>마포구</option> -->
<!-- 							<option>서대문구</option> -->
<!-- 							<option>서초구</option> -->
<!-- 							<option>성동구</option> -->
<!-- 							<option>성북구</option> -->
<!-- 							<option>송파구</option> -->
<!-- 							<option>양천구</option> -->
<!-- 							<option>영등포구</option> -->
<!-- 							<option>용산구</option> -->
<!-- 							<option>은평구</option> -->
<!-- 							<option>종로구</option> -->
<!-- 							<option>중구</option> -->
<!-- 							<option>중랑구</option> -->
<!-- 							<option>강서구</option> -->
<!-- 							<option>금정구</option> -->
						</select>
						<select name="hospital" id = "hospital">
<!-- 						<option selected="selected">강남병원</option> -->
<!-- 						<option >강남병원01</option> -->
<!-- 						<option >강남병원02</option> -->
<!-- 						<option >강남병원03</option> -->
<!-- 						<option >강남병원04</option> -->
<!-- 						<option >강남병원05</option> -->
<!-- 						<option >강남병원06</option> -->
<!-- 						<option >강남병원07</option> -->
						</select>
						</td>
					</tr>
					<tr>
						<th class="dateBox">예약일시</th>
						<td>
						<span class="material-icons">event_available</span>
						<input type="text" id="datepicker">
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
$(function() {
	$("#datepicker").datepicker();
});


function changeCategory(){
	let seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구","강서구","금정구"];
	let busan = ["남구","동구","동래구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","진구","해운대구","기장군"];
	let daegu = ["남구","달서구","북구","서구","중구","동구","남구","수성구","달성군"];
	let inchen = [ "미추홀구","연수구","남동구","북구","부평구","계양구","강화군","옹진군","동구","서구","남구"];
	let guangju = ["북구","광산구","동구","서구","남구"];
	let daejeon = ["유성구","대덕구","중구","동구","서구"];
	let ulsan = ["중구","남구","동구","북구","울주군"];
	let sejong = ["세종시"];
	let gyenggi = ["수원시","성남시","의정부시","안양시","부천시","광명시","평택시","동두천시","안산시","용인시","고양시","과천시","구리시","미금시","남양주시","오산시","시흥시","군포시","의왕시","하남시","파주시","이천시","안성시","김포시","화성시","광주시","양주시","포천시","여주시"];
	
	
	let target = $("#detailArea");
	let _this = $("#mainArea");
	let addList = null;
	console.log(_this.val());
	if(_this.val() == "서울") addList = seoul;
	else if(_this.val() == "부산") addList = busan;
	else if(_this.val() == "대구") addList = daegu;
	else if(_this.val() == "인천") addList = inchen;
	else if(_this.val() == "광주") addList = guangju;
	else if(_this.val() == "대전") addList = daejeon;
	else if(_this.val() == "울산") addList = ulsan;
	else if(_this.val() == "세종") addList = sejong;
	else if(_this.val() == "경기") addList = gyenggi;
	 
	$("#detailArea option").remove();  
	for (x in addList) {
		target.append("<option>"+ addList[x] +"</option>");
	}	
}

function changeCategory02(){
	let gangnam = ["강남병원","강남병원01","강남병원02","강남병원03","강남병원04","강남병원05","강남병원06","강남병원07"];
	let gangdong = ["강동병원","강동병원01","강동병원02","강동병원03","강동병원04","강동병원05","강동병원06","강동병원07","강동병원08","강동병원09",];
	let gangbuk = ["강북병원","강북병원01","강북병원02","강북병원03","강북병원04","강북병원05","강북병원06","강북병원07","강북병원08"];
	let gangseo = ["강서병원","강서병원01","강서병원02","강서병원03","강서병원04","강서병원05","강서병원06","강서병원07","강서병원08"];
	let guanak = ["관악병원","관악병원01","관악병원02","관악병원03","관악병원04","관악병원05","관악병원06","관악병원07","관악병원08"];
	let guangjin = ["광진병원","광진병원01","광진병원02","광진병원03","광진병원04","광진병원05","광진병원06","광진병원07","광진병원08"];
	let guro = ["구로병원","구로병원01","구로병원02","구로병원03","구로병원04","구로병원05","구로병원06","구로병원07","구로병원08"];
	let gyemchen = ["금천병원","금천병원01","금천병원02","금천병원03","금천병원04","금천병원05","금천병원06","금천병원07","금천병원08"];
	let nowon = ["노원병원","노원병원01","노원병원02","노원병원03","노원병원04","노원병원05","노원병원06","노원병원07","노원병원08"];
	
	
	let target = $("#hospital");
	let _this = $("#detailArea");
	let addList = null;
	console.log(_this.val());
	if(_this.val() == "강남구") addList = gangnam;
	else if(_this.val() == "강동구") addList = gangdong;
	else if(_this.val() == "강북구") addList = gangbuk;
	else if(_this.val() == "강서구") addList = gangseo;
	else if(_this.val() == "관악구") addList = guanak;
	else if(_this.val() == "광진구") addList = guangjin;
	else if(_this.val() == "구로구") addList = guro;
	else if(_this.val() == "금천구") addList = gyemchen;
	else if(_this.val() == "노원구") addList = nowon;
	 
	$("#hospital" option").remove();  
	for (x in addList) {
		target.append("<option>"+ addList[x] +"</option>");
	}	
}






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












