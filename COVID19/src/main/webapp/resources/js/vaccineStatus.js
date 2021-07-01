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
	let area = $("#area").val();
	
	let sendOptionData = null;
	let requestURL = null;
	let cityArray = [];
    let vaccineDataArray=[];

	if(type == "일별") type = 1;
	else if(type == "주별") type = 7;
	else if(type == "월별") type = 30;
	if(period == "1주") period = prevDataVaccine(7, dateToYearVaccine(new Date()));
	else if(period == "2주") period = prevDataVaccine(14, dateToYearVaccine(new Date()));
	else if(period == "1달") period = prevDataVaccine(30, dateToYearVaccine(new Date()));
	else if(period == "3달") period = prevDataVaccine(90, dateToYearVaccine(new Date()));
	else if(period == "전체") period = prevDataVaccine(1000, dateToYearVaccine(new Date()));
	//console.log(type);
	//console.log(period);
    //console.log(area);

    period = StringToDateVaccine(period);

	if(area == "전체"){
        type = type*18
		sendOptionData = {
			type : type,
			period : period
		};
		requestURL = "GetVaccineAllData.do";
	} else{
		sendOptionData = {
			type : type,
			area : area,
            period : period, 
		};
        console.log(sendOptionData);
		requestURL = "GetVaccineAllAreaData.do";
	}
    $.ajax({
        url:requestURL,
		data:sendOptionData,          
    })
    .done(function(result){          
        let total = result.length;
        dateArray = [];                            //날짜
        vaccineDataArray = [];                     //접종완료자 수   
		backgroundColorArray = [];

        for (let i = total-1; i>=0 ; i--){
            dateArray.push(result[i].baseDate.substring(0,11));       //날짜
            vaccineDataArray.push(result[i].secondCnt);               //접종완료자 수
			backgroundColorArray.push('rgba(99, 255, 132, 0.2)');
        }
         // 읽어온 데이터를 가지고 차트를 그려봅시다.
        var ctx = document.getElementById('myChart');    //chart 그릴 공간

        myChart = new Chart(ctx, {
            type: 'line',                           //차트 유형
            data: {                                 //차트에 포함되는 데이터들
                labels: dateArray,                  //label 이름 배열
                datasets: [{
                    label: '백신 접종현황',        //차트 제목
                    data: vaccineDataArray,             // label별 data 배열
					fill: false,
                    borderColor: 'rgb(70, 77, 82)',
					backgroundColor: backgroundColorArray,  //label별 배경색
                    borderColor:backgroundColorArray,      //label별 테두리 색
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
            let addList = [result.firstCnt, result.secondCnt, result.totalFirstCnt, result.totalSecondCnt];
            $("#vaccTotalDataBox td").remove();  
            for (x in addList) {
                $("#vaccTotalDataBox").append("<td>"+ addList[x].format() +" 명</td>");
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
                    if(x==0)
                        $("#areaDataBox").append("<td>"+ addList[x] +"</td>");
                    else
                        $("#areaDataBox").append("<td>"+ addList[x].format() +" 명</td>");
                }
			$("#areaDataBox").append("</tr>");
    	}
    	
    	addList = [result[sum].area, result[sum].secondCnt, result[sum].totalSecondCnt];
    	$("#areaDataBox").append("<tr>");
        addList[0] = "합계";
            for (x in addList) {
                if(x==0)
                    $("#areaDataBox").append("<td>"+ addList[x] +"</td>");
                else
                    $("#areaDataBox").append("<td>"+ addList[x].format() +" 명</td>");
            }
		$("#areaDataBox").append("</tr>");
		
    })
}