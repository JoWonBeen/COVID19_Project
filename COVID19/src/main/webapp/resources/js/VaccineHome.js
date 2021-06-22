$.ajax({
    url:"GetMainData.do",          
})
.done(function(result){
	let addList = [result.decideCnt, result.deathCnt, result.clearCnt, result.todayCnt];
	$("#totalDataBox td").remove();  
	for (x in addList) {
		$("#totalDataBox").append("<td>"+ addList[x] +"</td>");
	}
})