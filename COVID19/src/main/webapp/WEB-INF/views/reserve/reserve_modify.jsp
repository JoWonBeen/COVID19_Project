<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
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
		<h2>예약페이지</h2>
		<form action="ReserveModify.do" id="reserveForm" method="POST">
			<table>
				<colgroup>
					<col style="width: 400px">
					<col style="width: 1100px">
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
						<select name="gubun" id = "gubun">
						
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
						<th>의료기관 선택</th>
						<td>
						<select name="sido" id = "mainArea" onChange="changeCategory();">
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
						<select name="sigungu" id = "detailArea" onChange="changeCategory02();">
							<option>강남구</option>
							<option>강동구</option>
							<option>강북구</option>
							<option>강서구</option>
							<option>관악구</option>
							<option>광진구</option>
							<option>구로구</option>
							<option>금천구</option>
							<option>노원구</option>
							<option>도봉구</option>
							<option>동대문구</option>
							<option>동작구</option>
							<option>마포구</option>
							<option>서대문구</option>
							<option>서초구</option>
							<option>성동구</option>
							<option>성북구</option>
							<option>송파구</option>
							<option>양천구</option>
							<option>영등포구</option>
							<option>용산구</option>
							<option>은평구</option>
							<option>종로구</option>
							<option>중구</option>
							<option>중랑구</option>
							<option>강서구</option>
							<option>금정구</option>
						</select>
						<select name="hospital" id = "hospital">
						<option>강남병원</option>
						<option >강남병원01</option>
						<option >강남병원02</option>
						<option >강남병원03</option>
						<option >강남병원04</option>
						<option >강남병원05</option>
						<option >강남병원06</option>
						<option >강남병원07</option>
						</select>
						</td>
					</tr>
					<tr>
						<th class="dateBox">예약일시</th>
						<td>
						<span class="material-icons">event_available</span>
						<input type="text" id="datepicker" name = "date">
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
<script>
$(function() {
	$("#datepicker").datepicker({ minDate: 0});
});
$.ajax({
	url:"GetReserveData.do",
	success:function(result){
		console.log(result);
		let gubun = ["의료종사자","돌봄종사자(어린이집,유아교사)","사회필수인력(경찰,소방관,해경등)","60~75세 미만의 어르신","군인,군종사자,예비군,민방위","취약시설 입소 및 종사자","만성 신장질환자","일부 지정된 의료기관 종사자"];
		let target = $("#gubun");
		 
		$("#gubun option").remove();  
		for (x in gubun) {
			if (gubun[x] == result.gubun)
				target.append("<option selected='selected'>"+ gubun[x] +"</option>");
			else
				target.append("<option>"+ gubun[x] +"</option>");
		}
		let vaccine = ["아스트라제네카","얀센","화이자","모더나"];
		target = $("#vaccine");
		
		$("#vaccine option").remove();
		for(x in vaccine) {
			if(vaccine[x] == result.vaccine)
				target.append("<option selected='selected'>"+ vaccine[x] +"</option>");
			else
				target.append("<option>"+ vaccine[x] +"</option>");
		}
		let mainArea = ["서울특별시","부산광역시","대구광역시","인천광역시","광주광역시","대전광역시","울산광역시","세종시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
		target = $("#mainArea");
		
		let addressArr = result.hospitalAdd.split(" ");
		let address1 = addressArr[0];
		let address2 = addressArr[1];
		let address3 = addressArr[2];
	
		$("#mainArea option").remove();  
		for (x in mainArea) {
			console.log(result.hospitalAdd.substr(0,2));
			if(mainArea[x] == address1)
				target.append("<option selected='selected'>"+ mainArea[x] +"</option>");
			else
				target.append("<option>"+ mainArea[x] +"</option>");
		}
		let detailArea = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구","강서구","금정구","남구","동구","동래구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","진구","해운대구","기장군","남구","달서구","북구","서구","중구","동구","남구","수성구","달성군","미추홀구","연수구","남동구","북구","부평구","계양구","강화군","옹진군","동구","서구","남구","유성구","대덕구","중구","동구","서구","중구","남구","동구","북구","울주군","세종시","수원시","성남시","의정부시","안양시","부천시","광명시","평택시","동두천시","안산시","용인시","고양시","과천시","구리시","미금시","남양주시","오산시","시흥시","군포시","의왕시","하남시","파주시","이천시","안성시","김포시","화성시","광주시","양주시","포천시","여주시"];
		target = $("#detailArea");
		
		$("#detailArea option").remove();  
		for (x in detailArea) {
			console.log(result.hospitalAdd.substr(3,3));
			if(detailArea[x] == address2)
				target.append("<option selected='selected'>"+ detailArea[x] +"</option>");
			else
				target.append("<option>"+ detailArea[x] +"</option>");
		}
		let hospital = ["강남병원","강남병원01","강남병원02","강남병원03","강남병원04","강남병원05","강남병원06","강남병원07","강동병원","강동병원01","강동병원02","강동병원03","강동병원04","강동병원05","강동병원06","강동병원07","강동병원08","강동병원09","강북병원","강북병원01","강북병원02","강북병원03","강북병원04","강북병원05","강북병원06","강북병원07","강북병원08","강서병원","강서병원01","강서병원02","강서병원03","강서병원04","강서병원05","강서병원06","강서병원07","강서병원08","관악병원","관악병원01","관악병원02","관악병원03","관악병원04","관악병원05","관악병원06","관악병원07","관악병원08","광진병원","광진병원01","광진병원02","광진병원03","광진병원04","광진병원05","광진병원06","광진병원07","광진병원08","구로병원","구로병원01","구로병원02","구로병원03","구로병원04","구로병원05","구로병원06","구로병원07","구로병원08","금천병원","금천병원01","금천병원02","금천병원03","금천병원04","금천병원05","금천병원06","금천병원07","금천병원08","노원병원","노원병원01","노원병원02","노원병원03","노원병원04","노원병원05","노원병원06","노원병원07","노원병원08"];
		target = $("#hospital");
		
		$("#hospital option").remove();  
		for (x in hospital) {
			console.log(result.hospitalAdd.substr(7,4));
			if(hospital[x] == address3)
				target.append("<option selected='selected'>"+ hospital[x] +"</option>");
			else
				target.append("<option>"+ hospital[x] +"</option>");
		}
		
		let reserveDate = result.rsDate.split(" ")[0];
		let buf = reserveDate.split("-");
		reserveDate = buf[0] + "/" + buf[1] + "/" + buf[2];
 		$("#datepicker").val(reserveDate); 		
 		
 		let hour = ["09","10","11","12","13","14","15","16","17","18"];
 		target = $("#hour");
 		
 		$("#hour option").remove();
		for(x in hour) {
			if(hour[x] == result.rsDate.substr(11,2))
				target.append("<option selected='selected'>"+ hour[x] +"</option>");
			else
				target.append("<option>"+ hour[x] +"</option>");
		}
		let minute = ["00","15","30","45"];
 		target = $("#minute");
 		
 		$("#minute option").remove();
		for(x in minute) {
			if(minute[x] == result.rsDate.substr(11,2))
				target.append("<option selected='selected'>"+ minute[x] +"</option>");
			else
				target.append("<option>"+ minute[x] +"</option>");
		}
	}
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
	if(_this.val() == "서울특별시") addList = seoul;
	else if(_this.val() == "부산광역시") addList = busan;
	else if(_this.val() == "대구광역시") addList = daegu;
	else if(_this.val() == "인천광역시") addList = inchen;
	else if(_this.val() == "광주광역시") addList = guangju;
	else if(_this.val() == "대전광역시") addList = daejeon;
	else if(_this.val() == "울산광역시") addList = ulsan;
	else if(_this.val() == "세종시") addList = sejong;
	else if(_this.val() == "경기도") addList = gyenggi;
	 
	$("#detailArea option").remove();  
	for (x in addList) {
		target.append("<option>"+ addList[x] +"</option>");
	}	
}

function changeCategory02(){
	let gangnam = ["강남병원","강남병원01","강남병원02","강남병원03","강남병원04","강남병원05","강남병원06","강남병원07"];
	let gangdong = ["강동병원","강동병원01","강동병원02","강동병원03","강동병원04","강동병원05","강동병원06","강동병원07","강동병원08","강동병원09"];
	let gangbuk = ["강북병원","강북병원01","강북병원02","강북병원03","강북병원04","강북병원05","강북병원06","강북병원07","강북병원08"];
	let gangseo = ["강서병원","강서병원01","강서병원02","강서병원03","강서병원04","강서병원05","강서병원06","강서병원07","강서병원08"];
	let guanak = ["관악병원","관악병원01","관악병원02","관악병원03","관악병원04","관악병원05","관악병원06","관악병원07","관악병원08"];
	let guangjin = ["광진병원","광진병원01","광진병원02","광진병원03","광진병원04","광진병원05","광진병원06","광진병원07","광진병원08"];
	let guro = ["구로병원","구로병원01","구로병원02","구로병원03","구로병원04","구로병원05","구로병원06","구로병원07","구로병원08"];
	let gyemchen = ["금천병원","금천병원01","금천병원02","금천병원03","금천병원04","금천병원05","금천병원06","금천병원07","금천병원08"];
	let nowon = ["노원병원","노원병원01","노원병원02","노원병원03","노원병원04","노원병원05","노원병원06","노원병원07","노원병원08"];
	
	
	let target01 = $("#hospital");
	let _this01 = $("#detailArea");
	let addList01 = null;
	console.log(_this01.val());
	if(_this01.val() == "강남구") addList01 = gangnam;
	else if(_this01.val() == "강동구") addList01 = gangdong;
	else if(_this01.val() == "강북구") addList01 = gangbuk;
	else if(_this01.val() == "강서구") addList01 = gangseo;
	else if(_this01.val() == "관악구") addList01 = guanak;
	else if(_this01.val() == "광진구") addList01 = guangjin;
	else if(_this01.val() == "구로구") addList01 = guro;
	else if(_this01.val() == "금천구") addList01 = gyemchen;
	else if(_this01.val() == "노원구") addList01 = nowon;
	 
	$("#hospital option").remove();  
	for (x in addList01) {
		target01.append("<option>"+ addList01[x] +"</option>");
	}
	
	$("#reserveForm #reserve").on("click",function(){
	    if($("#gubun").val().length<=0) {
	        alert("대상자 구분은 필수 입력 사항입니다.");
	        $("#gubun").focus();
	        return;
	    }else if($("#vaccine").val().length<=0){
	        alert("백신은 필수 입력 사항입니다.");
	        $("#vaccine").focus();
	    } else if($("#mainArea").val().length<=0){
	        alert("시도별 선택은 필수 입력 사항입니다.");
	        $("#mainArea").focus();
	        return;
	    } else if($("#detailArea").val().length<=0){
	        alert("시군구별 선택은 필수 입력 사항입니다.");
	        $("#detailArea").focus();
	        return;
	    } else if($("#hospital").val().length<=0){
	        alert("병원은 필수 입력 사항입니다.");
	        $("#hospital").focus();
	        return;
	    } else if($("#datepicker").val().length<=0){
	        alert("날짜는 필수 입력 사항입니다.");
	        $("#datepicker").focus();
	        return;
	    } else if($("#hour").val().length<=0){
	        alert("예약시간은 필수 입력 사항입니다.");
	        $("#hour").focus();
	        return;
	    } else if($("#minute").val().length<=0){
	        alert("예약시간은 필수 입력 사항입니다.");
	        $("#minute").focus();
	        return;
	    }else {
	        $("#reserveForm").submit();
	    }
	});
}
</script>
</body>
</html>












