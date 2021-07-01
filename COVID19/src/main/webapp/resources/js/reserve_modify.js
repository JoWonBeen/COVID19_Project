$(function() {
	$("#datepicker").datepicker({ minDate: 0});
});
$.ajax({
	url:"GetReserveData.do",
	success:function(result){
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
			if(mainArea[x] == address1)
				target.append("<option selected='selected'>"+ mainArea[x] +"</option>");
			else
				target.append("<option>"+ mainArea[x] +"</option>");
		}
		let detailArea = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구","강서구","금정구","남구","동구","동래구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","진구","해운대구","기장군","남구","달서구","북구","서구","중구","동구","남구","수성구","달성군","미추홀구","연수구","남동구","북구","부평구","계양구","강화군","옹진군","동구","서구","남구","유성구","대덕구","중구","동구","서구","중구","남구","동구","북구","울주군","세종시","수원시","성남시","의정부시","안양시","부천시","광명시","평택시","동두천시","안산시","용인시","고양시","과천시","구리시","미금시","남양주시","오산시","시흥시","군포시","의왕시","하남시","파주시","이천시","안성시","김포시","화성시","광주시","양주시","포천시","여주시"];
		target = $("#detailArea");
		
		$("#detailArea option").remove();  
		for (x in detailArea) {
			if(detailArea[x] == address2)
				target.append("<option selected='selected'>"+ detailArea[x] +"</option>");
			else
				target.append("<option>"+ detailArea[x] +"</option>");
		}
		let hospital = ["강남병원","강남병원01","강남병원02","강남병원03","강남병원04","강남병원05","강남병원06","강남병원07","강동병원","강동병원01","강동병원02","강동병원03","강동병원04","강동병원05","강동병원06","강동병원07","강동병원08","강동병원09","강북병원","강북병원01","강북병원02","강북병원03","강북병원04","강북병원05","강북병원06","강북병원07","강북병원08","강서병원","강서병원01","강서병원02","강서병원03","강서병원04","강서병원05","강서병원06","강서병원07","강서병원08","관악병원","관악병원01","관악병원02","관악병원03","관악병원04","관악병원05","관악병원06","관악병원07","관악병원08","광진병원","광진병원01","광진병원02","광진병원03","광진병원04","광진병원05","광진병원06","광진병원07","광진병원08","구로병원","구로병원01","구로병원02","구로병원03","구로병원04","구로병원05","구로병원06","구로병원07","구로병원08","금천병원","금천병원01","금천병원02","금천병원03","금천병원04","금천병원05","금천병원06","금천병원07","금천병원08","노원병원","노원병원01","노원병원02","노원병원03","노원병원04","노원병원05","노원병원06","노원병원07","노원병원08"];
		target = $("#hospital");
		
		$("#hospital option").remove();  
		for (x in hospital) {
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
		let sendAddress = {
			mainArea : mainArea,
			detailArea : detailArea, 
			roadName : roadName
		};
	    $.ajax({
	    	url:"GetHospitalByAddress.do",
			data:sendAddress          
	    })
	    .done(function(result){
	     	let target = $("#hospital");
	    	 
	     	$("#hospital option").remove();  
			target.append("<option selected='selected'>선택하세요</option>");
	     	for (x in result) {
	     		target.append("<option>"+ result[x] +"</option>");
	     	}	
	    });
	}
	    
}

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