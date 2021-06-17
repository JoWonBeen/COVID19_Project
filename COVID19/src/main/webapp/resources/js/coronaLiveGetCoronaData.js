updateCoronaData();
updateCoronaDataSido();
function updateCoronaData(){
	let lastDate = null;
	let coronaList = null;
	$.ajax({
		url:"GetLastDate.do",
		success:function(resultData){
			lastDate = resultData;
			let sendData = {
				start:lastDate,
				end: dateToYear(new Date())
			}
			if(lastDate < dateToYear(new Date())){
				$.ajax({
					url:"CoronaApiCallDate.do",
					data:sendData,
					success:function(resultData){
						let list_length = 0;
						if(resultData.response.body.items.item != null) {
							coronaList = resultData.response.body.items.item;
							list_length = coronaList.length;
							console.log(coronaList);
						}
						let dataList = "";
						for(let i = 0; i < list_length-1; i++){
							let stateDt = coronaList[i].stateDt;
							let deathCnt = coronaList[i].deathCnt.toString();
							let decideCnt = coronaList[i].decideCnt.toString();
							let clearCnt = coronaList[i].clearCnt.toString();
							let todayCnt = (coronaList[i].decideCnt - coronaList[i+1].decideCnt).toString();
							dataList += stateDt +"/"+ deathCnt +"/"+ decideCnt +"/"+ clearCnt +"/"+ todayCnt;
							dataList += "&";
						}
						sendData = {
							dataList:dataList
						}
						$.ajax({
							url:"InsertCoronaInfo.do",
							data:sendData,
							success:function(resultData){
								console.log(resultData);
							}
						})
					}
				});
			}
		}
	});
}

function updateCoronaDataSido(){
	let lastDate = null;
	let coronaList = null;
	$.ajax({
		url:"GetLastDateSido.do",
		success:function(resultData){
			lastDate = resultData;
			let sendData = {
				start:lastDate,
				end: dateToYear(new Date())
			}
			if(lastDate < dateToYear(new Date())){
				$.ajax({
					url:"CoronaApiCallArea.do",
					data:sendData,
					success:function(resultData){
						let list_length = 0;
						if(resultData.response.body.items.item != null) {
							coronaList = resultData.response.body.items.item;
							list_length = coronaList.length;
							console.log(coronaList);
						}
						let dataList = "";
						for(let i = 0; i < list_length-19; i++){
							let stateDt = StringToDate(coronaList[i].stdDay);
							let deathCnt = coronaList[i].deathCnt.toString();
							let todayCnt = (coronaList[i].defCnt - coronaList[i+19].defCnt).toString();
							let area = coronaList[i].gubun;
							dataList += stateDt +"/"+ deathCnt +"/"+ todayCnt +"/"+ area;
							dataList += "&";
						}
						sendData = {
							dataList:dataList
						}
						$.ajax({
							url:"InsertCoronaInfoSido.do",
							data:sendData,
							success:function(resultData){
								console.log(resultData);
							}
						})
					}
				});
			}
		}
	});
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

function prevData(amount, _date){
 
	if(typeof _date == "number"){
		_date = _date.toString();
	}
	_date = new Date(Number(_date.substring(0,4)),Number(_date.substring(4,6))-1,Number(_date.substring(6,8)));
    let _buf_date = _date;
	
    _buf_date.setDate(_buf_date.getDate() - amount);
    _buf_date = dateToYear(_buf_date);
    return _buf_date;
}

function changeCategory(){
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

