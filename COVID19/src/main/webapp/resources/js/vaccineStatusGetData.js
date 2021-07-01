
updateVaccineStatusData();

function updateVaccineStatusData(){
	let lastDate = null;
	let vaccineList = null;
	$.ajax({
		url:"GetVaccStatusLastDate.do",
		success:function(resultData){
			lastDate = resultData;
			if(lastDate < dateToYearVaccine(new Date())){
				lastDate = StringToDateVaccine(lastDate);
				let sendData = {
					baseDate:lastDate,
				}
				$.ajax({
					url:"VaccineStatusApiCall.do",
					data:sendData,
					success:function(resultData){
						let list_length = 0;
						if(resultData.data != null) {
							vaccineList = resultData.data;
							list_length = vaccineList.length;
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
			}
		}
	})			
}



function dateToYearVaccine(_date) {
    let year = _date.getFullYear();
    let month = _date.getMonth() + 1;
    if (month < 10) month = '0' + month;
    let date = _date.getDate();
    if (date < 10) date = '0' + date;
    return year + '' + month + '' + date;
}
function StringToDateVaccine(_str) {
	//console.log(_str);
	if(typeof _str == "number"){
		_str = _str.toString();
	}
	let str = _str.slice(0,4) +"-"+ _str.slice(4,6) +"-"+ _str.slice(6,8) + " "+"00:00:00";
    return str;
}

function prevDataVaccine(amount, _date){
	//console.log(_date);
	if(typeof _date == "number"){
		_date = _date.toString();
	}
	_date = new Date(Number(_date.substring(0,4)),Number(_date.substring(4,6))-1,Number(_date.substring(6,8)));
    let _buf_date = _date;
	
    _buf_date.setDate(_buf_date.getDate() - amount);
    _buf_date = dateToYearVaccine(_buf_date);
    return _buf_date;
}



function changeVaccineCategory(){
	let category1 = ["1주", "2주", "1달", "3달", "전체"];
	let category2 = ["1달", "3달", "전체"];
	let category3 = ["3달", "전체"];
	
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