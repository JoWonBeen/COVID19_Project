showMainVaccineData();
showVaccineData();
showAreaVaccineData();

var myChart = null;

function showVaccineData(){
	if(myChart != null){
		myChart.destroy();
	}
	let type = $("#type").val();
	let period = $("#period").val();
	//let area = $("#area").val();
	
	let sendOptionData = null;
	let requestURL = null;
	//let cityArray = [];
    //let incDecArray=[];

	if(type == "일별") type = 1;
	else if(type == "주별") type = 7;
	else if(type == "월별") type = 30;
	if(period == "1주") period = prevData(7, dateToYear(new Date()));
	else if(period == "2주") period = prevData(14, dateToYear(new Date()));
	else if(period == "1달") period = prevData(30, dateToYear(new Date()));
	else if(period == "3달") period = prevData(90, dateToYear(new Date()));
	else if(period == "1년") period = prevData(365, dateToYear(new Date()));
	else if(period == "전체") period = prevData(1000, dateToYear(new Date()));
	
	if(area == "전체"){
		sendOptionData = {
			type : type,
			period : period
		};
		requestURL = "GetAllAreaData.do";
	}
		requestURL = "GetAreaData.do";
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
            type: 'line',                           // 차트 유형
            data: {                                 // 차트에 포함되는 데이터들
                labels: dateArray,                  // label 이름 배열
                datasets: [{
                    label: '백신 접종현황',       // 차트 제목
                    data: incDecArray,             // label별 data 배열
					fill: false,
                    borderColor: 'rgb(70, 77, 82)',
					backgroundColor: backgroundColorArray,  // label별 배경색
                    borderColor:backgroundColorArray,       // label별 테두리 색
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

function showMainVaccineData(){
    let area = "전국";
    let sendData = {
        area:area,   
       }
	$.ajax({
        url:"GetVaccineMainData.do",   
        data:sendData,
        success:function(result){
            console.log(result);
            let addList = [result.firstCnt, result.secondCnt, result.totalFirstCnt, result.totalSecondCnt];
            $("#vaccTotalDataBox td").remove();  
            for (x in addList) {
                $("#vaccTotalDataBox").append("<td>"+ addList[x] +"</td>");
            }
        }
    })
}


function showAreaVaccineData(){
	$.ajax({
        url:"GetVaccineAreaData.do",          
    })
    .done(function(result){
        let sum = 0;
    	for(let i = 0; i < result.length; i++){
	    	let addList = [result[i].area, result[i].secondCnt, result[i].totalSecondCnt];
	    	if (addList[0] == "전국"){
				sum = i;
				continue;
			}
		
			$("#areaDataBox").append("<tr>");
			for (x in addList) {
				$("#areaDataBox").append("<td style = 'border:1px solid gray;'>"+ addList[x] +"</td>");
			}
			$("#areaDataBox").append("</tr>");
    	}
    	
    	addList = [result[sum].area, result[sum].secondCnt, result[sum].totalSecondCnt];
    	$("#areaDataBox").append("<tr>");
        addList[0] = "합계";
		for (x in addList) {
			$("#areaDataBox").append("<td style = 'border:1px solid gray;'>"+ addList[x] +"</td>");
		}
		$("#areaDataBox").append("</tr>");
		
    })
}