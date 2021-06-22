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
	<div class="formBox">
		<h2>예약페이지</h2>
		<form action="ReserveWrite.do" id="reserveForm" method="POST">
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
						<select name="gubun" id="gubun">
						<option selected="selected">선택하세요</option>
						<option>의료종사자</option>
						<option>돌봄종사자(어린이집,유아교사)</option>
						<option>사회필수인력(경찰,소방관,해경등)</option>
						<option>60~75세 미만의 어르신</option>
						<option>군인,군종사자,예비군,민방위</option>
						<option>취약시설 입소 및 종사자</option>
						<option>만성 신장질환자</option>
						<option>일부 지정된 의료기관 종사자</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>의료기관 선택</th>
						<td>
						<select name="sido" id = "mainArea" onChange="changeCategory();">
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
						<select name="sigungu" id = "detailArea"> <!-- onChange="changeCategory02();" -->
							<option selected="selected">선택하세요</option>
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
						<input type="text" name="roadName" id="roadName" onkeyup="choiceHospital(this)" placeholder = "ex)중부대로">
						<select name="hospital" id = "hospital">
						<option selected="selected">선택하세요</option>
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
						<th>예약 대상 백신</th>
						<td>
						<select name="vaccine" id="vaccine">
						<option selected="selected">선택하세요</option>
						<option>아스트라제네카</option>
						<option>얀센</option>
						<option>화이자</option>
						<option>모더나</option>
						</select>
						</td>
					</tr>
					<tr>
						<th class="dateBox">예약일시</th>
						<td>
						<span class="material-icons">event_available</span>
						<input type="text" id="datepicker" name = "date">
						<select name="hour" id="hour">
						<option selected="selected">선택하세요</option>
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
						<option selected="selected">선택하세요</option>
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
				<input type="button" value="확인" id="reserve"> 
				<input type="reset" value="취소" id="cancel">
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
<script>

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
	
	let gangwon = [ "춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군","영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군"]; 
	let chungbuk = ["청주시", "충주시", "제천시", "보은군", "옥천군","영동군", "증평군", "진천군", "괴산군", "음성군", "단양군"]; 
	let chungnam = ["천안시", "공주시", "보령시", "아산시","서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군","태안군"]; 
	let jeonbuk = ["전주시","군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군","순창군", "고창군", "부안군"]; 
	let jeonnam = ["목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군","화순군", "장흥군", "강진군", "해남군", "영암군", "무안군", "함평군", "영광군", "장성군", "완도군","진도군", "신안군"]; 
	let kyungbuk = [ "포항시 남구", "포항시 북구", "경주시", "김천시","안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군","영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군"]; 
	let kyungnam = [ "창원시 의창구", "창원시 성산구", "창원시 마산합포구", "창원시 마산회원구", "창원시 진해구","진주시", "통영시", "사천시", "김해시", "밀양시", "거제시", "양산시", "의령군", "함안군", "창녕군","고성군", "남해군", "하동군", "산청군", "함양군", "거창군", "합천군"]; 
	let jeju = ["제주시", "서귀포시"];
	
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
	else if(_this.val() == "강원도") addList = gangwon;
	else if(_this.val() == "충청북도") addList = chungbuk;
	else if(_this.val() == "충청남도") addList = chungnam;
	else if(_this.val() == "전라북도") addList = jeonbuk;
	else if(_this.val() == "전라남도") addList = jeonnam;
	else if(_this.val() == "경상북도") addList = kyungbuk;
	else if(_this.val() == "경상남도") addList = gyenggi;
	else if(_this.val() == "제주도") addList = jeju;
	 
	$("#detailArea option").remove();  
	for (x in addList) {
		target.append("<option>"+ addList[x] +"</option>");
	}	
}

function choiceHospital(el){
	let roadName = el.value;            // 도로명
	let mainArea = $("#mainArea").val();      // oo시
	let detailArea = $("#detailArea").val();  // oo구
	if(roadName.slice(-1) == "로" || roadName.slice(-1) == "길"){
		console.log(roadName);
		console.log(mainArea);
		console.log(detailArea);
		sendAddress = {
			mainArea : mainArea,
			detailArea : detailArea, 
			roadName : roadName
		};
	    $.ajax({
	    	url:"GetHospitalByAddress.do",
			data:sendAddress          
	    })
	    .done(function(result){
	    	console.log(result);
	    });
	}
	    
}


// function changeCategory02(){
// 	let gangnam = ["강남병원","강남병원01","강남병원02","강남병원03","강남병원04","강남병원05","강남병원06","강남병원07"];
// 	let gangdong = ["강동병원","강동병원01","강동병원02","강동병원03","강동병원04","강동병원05","강동병원06","강동병원07","강동병원08","강동병원09",];
// 	let gangbuk = ["강북병원","강북병원01","강북병원02","강북병원03","강북병원04","강북병원05","강북병원06","강북병원07","강북병원08"];
// 	let gangseo = ["강서병원","강서병원01","강서병원02","강서병원03","강서병원04","강서병원05","강서병원06","강서병원07","강서병원08"];
// 	let guanak = ["관악병원","관악병원01","관악병원02","관악병원03","관악병원04","관악병원05","관악병원06","관악병원07","관악병원08"];
// 	let guangjin = ["광진병원","광진병원01","광진병원02","광진병원03","광진병원04","광진병원05","광진병원06","광진병원07","광진병원08"];
// 	let guro = ["구로병원","구로병원01","구로병원02","구로병원03","구로병원04","구로병원05","구로병원06","구로병원07","구로병원08"];
// 	let gyemchen = ["금천병원","금천병원01","금천병원02","금천병원03","금천병원04","금천병원05","금천병원06","금천병원07","금천병원08"];
// 	let nowon = ["노원병원","노원병원01","노원병원02","노원병원03","노원병원04","노원병원05","노원병원06","노원병원07","노원병원08"];
	
	
// 	let target01 = $("#hospital");
// 	let _this01 = $("#detailArea");
// 	let addList01 = null;
// 	console.log(_this01.val());
// 	if(_this01.val() == "강남구") addList01 = gangnam;
// 	else if(_this01.val() == "강동구") addList01 = gangdong;
// 	else if(_this01.val() == "강북구") addList01 = gangbuk;
// 	else if(_this01.val() == "강서구") addList01 = gangseo;
// 	else if(_this01.val() == "관악구") addList01 = guanak;
// 	else if(_this01.val() == "광진구") addList01 = guangjin;
// 	else if(_this01.val() == "구로구") addList01 = guro;
// 	else if(_this01.val() == "금천구") addList01 = gyemchen;
// 	else if(_this01.val() == "노원구") addList01 = nowon;
	 
// 	$("#hospital option").remove();  
// 	for (x in addList01) {
// 		target01.append("<option>"+ addList01[x] +"</option>");
// 	}	
// }

$(function() {
	$("#datepicker").datepicker({ minDate: 0});
});



$("#reserve").on("click",function(){
    if($("#gubun").val() == "선택하세요") {
        alert("대상자 구분은 필수 입력 사항입니다.");
        return;
    }else if($("#vaccine").val() == "선택하세요"){
        alert("백신은 필수 입력 사항입니다.");
        return;
    } else if($("#mainArea").val() == "선택하세요"){
        alert("시도별 선택은 필수 입력 사항입니다.");
        return;
    } else if($("#detailArea").val() == "선택하세요"){
        alert("시군구별 선택은 필수 입력 사항입니다.");
        return;
    } else if($("#hospital").val() == "선택하세요"){
        alert("병원은 필수 입력 사항입니다.");
        return;
    } else if($("#datepicker").val().length <= 0){
        alert("날짜는 필수 입력 사항입니다.");
        return;
    } else if($("#hour").val() == "선택하세요"){
        alert("예약시간은 필수 입력 사항입니다.");
        return;
    } else if($("#minute").val() == "선택하세요"){
        alert("예약시간은 필수 입력 사항입니다.");
        return;
    }else {
        $("#reserveForm").submit();
    }
});
</script>
</body>
</html>














