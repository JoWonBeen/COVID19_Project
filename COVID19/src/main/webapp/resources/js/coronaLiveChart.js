var myChart = null;
showMainData();
showCoronaData();
showAreaData();

function showCoronaData(){
	if(myChart != null){
		myChart.destroy();
	}
	let type = $("#type").val();
	let period = $("#period").val();
	let area = $("#area").val();
	
	let sendOptionData = null;
	let requestURL = null;
	let cityArray = [];
    let incDecArray=[];

	if(type == "일별") type = 1;
	else if(type == "주별") type = 7;
	else if(type == "월별") type = 30;
	if(period == "1주") period = prevData(7, dateToYear(new Date()));
	else if(period == "2주") period = prevData(14, dateToYear(new Date()));
	else if(period == "1달") period = prevData(30, dateToYear(new Date()));
	else if(period == "3달") period = prevData(90, dateToYear(new Date()));
	else if(period == "6달") period = prevData(180, dateToYear(new Date()));
	else if(period == "1년") period = prevData(365, dateToYear(new Date()));
	else if(period == "전체") period = prevData(1000, dateToYear(new Date()));
	
	if(area == "전체"){
		sendOptionData = {
			type : type,
			period : period
		};
		requestURL = "GetAllAreaData.do";
	} else{
		sendOptionData = {
			type : type,
			period : period, 
			area : area
		};
		requestURL = "GetAreaData.do";
	}
    $.ajax({
        url:requestURL,
		data:sendOptionData,          
    })
    .done(function(result){          
		//--------------------------------------------------
		
        let total = result.length;
        dateArray = [];                             //지역
        incDecArray = [];                        //확진자 수
		backgroundColorArray = [];
        for (let i = total-1; i>=0 ; i--){
            dateArray.push(result[i].startDate);    // 코로나 발생 지역
            incDecArray.push(result[i].todayCnt); // 지역별 확진자 수
			backgroundColorArray.push('rgba(255, 99, 132, 0.2)');
        }
         // 읽어온 데이터를 가지고 차트를 그려봅시다.
        var ctx = document.getElementById('myChart');    // chart를 그릴 공간



        myChart = new Chart(ctx, {
            type: 'line',                                                                // 차트 유형
            data: {                                 // 차트에 포함되는 데이터들
                labels: dateArray,                 // label 이름 배열
                datasets: [{
                    label: '코로나 발생현황',       // 차트 제목
                    data: incDecArray,             // label별 data 배열
					fill: false,
                    borderColor: 'rgb(70, 77, 82)',
					backgroundColor: backgroundColorArray, // label별 배경색
                    borderColor:backgroundColorArray,// label별 테두리 색
                    borderWidth: 5
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
		//--------------------------------------------------
    })
}


Number.prototype.format = function(){
    if(this==0) return 0;
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
    return n;
};
 
String.prototype.format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";
    return num.format();
};



function showMainData(){
	$.ajax({
        url:"GetMainData.do",          
    })
    .done(function(result){
    	let addList = [result.decideCnt, result.deathCnt, result.clearCnt, result.todayCnt];
    	$("#totalDataBox td").remove();  
		for (x in addList) {
			$("#totalDataBox").append("<td>"+ addList[x].format() +" 명</td>");
			
		}
    })
}

function showAreaData(){
	$.ajax({
        url:"GetAreaTodayData.do",          
    })
    .done(function(result){
    	let gumyeok = 0;
    	let sumDate = 0;
    	for(let i = 0; i < result.length; i++){
	    	let addList = [result[i].area, result[i].todayCnt, result[i].defCnt, result[i].deathCnt];
	    	if (addList[0] == "검역"){
				gumyeok = i;
				continue;
			}
			else if(addList[0] == "합계"){
				sumData = i;
				continue;
			}
			$("#areaDataBox").append("<tr>");
			for (x in addList) {
//				$("#areaDataBox").append("<td style = 'border:1px solid gray;'>"+ addList[x] +"</td>");
				if(x==0)
					$("#areaDataBox").append("<td>"+ addList[x] +"</td>");
				else
					$("#areaDataBox").append("<td>"+ addList[x].format() +" 명</td>");
			}
			$("#areaDataBox").append("</tr>");
    	}
    	
    	addList = [result[gumyeok].area, result[gumyeok].todayCnt, result[gumyeok].defCnt, result[gumyeok].deathCnt];
    	$("#areaDataBox").append("<tr>");
		for (x in addList) {
//			$("#areaDataBox").append("<td style = 'border:1px solid gray;'>"+ addList[x] +"</td>");
			if(x==0)
				$("#areaDataBox").append("<td>"+ addList[x] +"</td>");
			else
				$("#areaDataBox").append("<td>"+ addList[x].format() +" 명</td>");
		}
		$("#areaDataBox").append("</tr>");
		
		addList = [result[sumData].area, result[sumData].todayCnt, result[sumData].defCnt, result[sumData].deathCnt]
    	$("#areaDataBox").append("<tr>");
		for (x in addList) {
//			$("#areaDataBox").append("<td style = 'border:1px solid gray;'>"+ addList[x] +"</td>");
			if(x==0)
				$("#areaDataBox").append("<td>"+ addList[x] +"</td>");
			else
				$("#areaDataBox").append("<td>"+ addList[x].format() +" 명</td>");
		}
		$("#areaDataBox").append("</tr>");
    })
}

// 다크모드
const darkModeBtn = $("#modeBtn");
darkModeBtn.on("click", function(){
     $("#coronaLiveBox").toggleClass("dark");
     $("#darkModeBox").toggleClass("dark");
     $("#coronaLivePageBox").toggleClass("dark");
     $("body").toggleClass("dark");
 	 if($("#coronaLivePageBox").hasClass("dark")){
	 	$("#header #logo a img").attr("src","images/logo-white.png");
	} else{
		$("#header #logo a img").attr("src","images/logo.png");	
	}
     

})