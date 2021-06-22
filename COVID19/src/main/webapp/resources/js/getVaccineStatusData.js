getVaccineStatusData();

function getVaccineStatusData(){
    //console.log("fuct실행");
    $.ajax({
        url:"VaccineStatusApiCall.do",
        success:function(resultData){
            console.log(resultData);
        }
    })
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