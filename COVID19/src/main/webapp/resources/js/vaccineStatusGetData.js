//updateVaccineStatusData();

function updateVaccineStatusData(){
    //console.log("fuct실행");
	let lastDate = null;
	let vaccineList = null;
	// $.ajax({
	// 	url:"GetVaccStatusLastDate.do",
	// 	success:function(resultData){
	// 		lastDate = resultData;
	// 		let sendData = {
	// 			baseDate:lastDate,
	// 			//end: dateToYear(new Date())
	// 		}
	// 		if(lastDate < dateToYear(new Date())){
				$.ajax({
					url:"VaccineStatusApiCall.do",
					//data:sendData,
					success:function(resultData){
						console.log(resultData);
						let list_length = 0;
						if(resultData.data != null) {
							vaccineList = resultData.data;
							list_length = vaccineList.length;
							console.log(vaccineList);
							console.log(list_length);
						}
						let dataList = "";
						for(let i = 0; i < list_length; i++){
							let baseDate = vaccineList[i].baseDate;
							let area = vaccineList[i].sido;
							let firstCnt = vaccineList[i].firstCnt.toString();
							let secondCnt = vaccineList[i].secondCnt.toString();
							let totalFirstCnt = vaccineList[i].totalFirstCnt.toString();
							let totalSecondCnt = vaccineList[i].totalSecondCnt.toString();

							dataList += baseDate +"/"+ area +"/"+ firstCnt +"/"+ secondCnt +"/"+ totalFirstCnt + "/" + totalSecondCnt;
							dataList += "&";
						}
						sendData = {
							dataList:dataList
						}
						if(dataList != ""){
							$.ajax({
								url:"InsertVaccineInfo.do",
								data:sendData,
								success:function(resultData){
									console.log(resultData);
								}
							})
						}
					}
				})
	// 		}
	// 	}
	// })			
}




function dateToYear(_date) {
    let year = _date.getFullYear();
    let month = _date.getMonth() + 1;
    if (month < 10) month = '0' + month;
    let date = _date.getDate();
    if (date < 10) date = '0' + date;
    return year + '' + month + '' + date;
}
function StringToDate(_str) {
	let arr = _str.split(" ");
    _date = new Date(parseInt(arr[0]),parseInt(arr[1])-1,parseInt(arr[2]));
    _buf_date = dateToYear(_date);
    return _buf_date;
}



function changeCategory(){
	let category1 = ["1주", "2주", "1달", "3달","6달", "1년", "전체"];
	let category2 = ["1달", "3달","6달", "1년", "전체"];
	let category3 = ["3달","6달", "1년", "전체"];
	
	let target = $("#period");
	let _this = $("#type");
	let addList = null;
	
	if(_this.val() == "일별") addList = category1;
	else if(_this.val() == "주별") addList = category2;
	else if(_this.val() == "월별") addList = category3;
	 
	$("#period option").remove();  
	for (x in addList) {
		if(x == 0)
			target.append("<option selected='selected'>"+ addList[x] +"</option>");
		else
			target.append("<option>"+ addList[x] +"</option>");
	}	
}