$.ajax({
    url:"GetMainData.do",          
})
.done(function(result){
	$("#coronaTotalDataBox p").remove();  
	$("#coronaTotalDataBox").append("<p>확진자 수 : "+ result.todayCnt +"명</p>");
})