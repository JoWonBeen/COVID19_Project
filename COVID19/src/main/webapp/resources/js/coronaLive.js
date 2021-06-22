//showCoronaData();

function showCoronaData(){
	let _type = $("#coronaOptionBox #type").val();
	let _period = $("#coronaOptionBox #period").val(); 
	let _area = $("#coronaOptionBox #area").val();
	let start_date = new Date();
	let end_date = new Date();

	if(_period == "1주") start_date.setDate(start_date.getDate() - 7);
	else if(_period == "2주") start_date.setDate(start_date.getDate() - 14);
	else if(_period == "1달") start_date.setMonth(start_date.getMonth() - 1);
	else if(_period == "3달") start_date.setMonth(start_date.getMonth() - 3);
	else if(_period == "1년") start_date.setMonth(start_date.getMonth() - 12);
	else start_date = new Date("2020/01/01");

	
	start_date = dateToYear(start_date);
	end_date = dateToYear(end_date);  // 20200101
	let sendData = {
		start:start_date,
		end:end_date
    }
	let buf_date = null;
	if(_type == "일별") buf_date = 1;
	else if(_type == "주별") buf_date = 7;
	else if(_type == "월별") buf_date = 30;
	

	// 지역이 전체일 경우, 코로나 일별 확진자 현황으로 가서 날짜별 집계를 한다.
	if(_area == "전체"){
		let DEATH_CNT = 0; // 사망자 수
		let DECIDE_CNT = 0; // 확진자 수
		let CLEAR_CNT = 0; // 격리 해제 수
				
		sendData = {
			start:dateToYear(new Date()),  // 오늘 날짜
			end:dateToYear(new Date())
	    }
	    // 총 확진자 수, 사망자 수, 격리 해제 수 구하기 위한 통신
		CORONA_CNT = [];
	    $.ajax({
			url:"CoronaApiCallDate.do",
			data:sendData,
			success:function(resultData){
				console.log(resultData);
				let coronaList = resultData.response.body.items.item;
				DECIDE_CNT += coronaList[0].decideCnt;
				CLEAR_CNT += coronaList[0].clearCnt;
				DEATH_CNT = coronaList[0].deathCnt;
				CORONA_CNT.push(DECIDE_CNT);
				CORONA_CNT.push(CLEAR_CNT);
				CORONA_CNT.push(DEATH_CNT); 		
				console.log("총 확진자 수 : ", DECIDE_CNT);
				console.log("격리 해제 수 : ", CLEAR_CNT);
				console.log("총 사망자 수 : ", DEATH_CNT);
			}
		});	
		PERIOD_CNT_LIST = [];
		while(start_date < end_date){
			let prev_date = prevData(buf_date, end_date);
		    $.ajax({
				url:"CoronaApiCallDate.do",
				data:sendData,
				success:function(resultData){
					console.log(resultData);
					let coronaList = resultData.response.body.items.item;
					let PERIOD_CNT = coronaList[0].deathCnt - coronaList[-1]
					PERIOD_CNT_LIST.push([sendData.start, sendData.end, PERIOD_CNT])
					console.log("날짜 : ", sendData.start, "~", sendData.end);
					console.log("확진자 수 : ", PERIOD_CNT);
					
				}
			});	
	        end_date = new Date(Number(end_date.substring(0,4)),Number(end_date.substring(4,6))-1,Number(end_date.substring(6,8)));
	        end_date.setDate(end_date.getDate() - buf_date);
	        end_date = dateToYear(end_date);
	        
		}



    // 지역이 전체가 아니면, 시도 발생 현황에 가서 날짜별 합계를 구한다.
	} else{   
		while(start_date < end_date){
			let prev_date = prevData(buf_date, end_date);
			sendData = {
				start:prev_date,
				end:end_date
		    }
		    $.ajax({
		        url:"CoronaApiCallArea.do",
		        data:sendData,
		        success:function(resultData){
					console.log(resultData.response.body.items.item);
		            let coronaList = resultData.response.body.items.item;
					let sum_people = 0;
					
					for(let i = 0; i < coronaList.length; i++){
						if(coronaList[i].gubun == _area){
							sum_people += coronaList[i].localOccCnt;
						} 
					}
					console.log("지역 : ", _area);
					console.log("날짜 : ", prev_date, "~", end_date);
					console.log("확진자 : ", sum_people);
		            
		        }
	        });	

	        end_date = new Date(Number(end_date.substring(0,4)),Number(end_date.substring(4,6))-1,Number(end_date.substring(6,8)));
	        end_date.setDate(end_date.getDate() - buf_date);
	        end_date = dateToYear(end_date);
	        
		}
	}
  

}

function dateToYear(_date) {
    let year = _date.getFullYear();
    let month = _date.getMonth() + 1;
    if (month < 10) month = '0' + month;
    let date = _date.getDate();
    if (date < 10) date = '0' + date;
    return year + '' + month + '' + date;
}
function prevData(amount, _date){
	_date = new Date(Number(_date.substring(0,4)),Number(_date.substring(4,6))-1,Number(_date.substring(6,8)));
    let _buf_date = _date;
	
    _buf_date.setDate(_buf_date.getDate() - amount);
    _buf_date = dateToYear(_buf_date);
    return _buf_date;
}

function changeCoronaCategory(){
	let category1 = ["1주", "2주", "1달", "3달", "1년", "전체"];
	let category2 = ["1주", "2주", "1달", "3달", "1년", "전체"];
	let category3 = ["1달", "3달", "1년", "전체"];
	
	let target = $("#period");
	let _this = $("#type");
	let addList = null;
	
	if(_this.val() == "일별") addList = category1;
	else if(_this.val() == "주별") addList = category2;
	else if(_this.val() == "월별") addList = category3;
	 
	$("#period option").remove();  
	for (x in addList) {
		target.append("<option>"+ addList[x] +"</option>");
	}	
}

