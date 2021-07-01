$.ajax({
    url:"GetMainData.do",          
})
.done(function(result){
	$("#coronaTotalDataBox p").remove();  
	$("#coronaTotalDataBox").append("<p>확진자 수 : "+ result.todayCnt +"명</p>");
});


const mainSlider  = new Swiper("#mainVisualBox .mask", {
    speed:1000,
    loop:true,
	effect:"fade",
	navigation:{
		nextEl:"mainVisualBox .next",
		prevEl:"mainVisualBox .prev",
	},
	pagination: {
	    el: "#mainVisualBox .pagination",
	    type: "bullets",
		clickable:true,
    },
 	autoplay: {                     
      delay:3000,    
	},
});


showVaccineDataMainHome();

function showVaccineDataMainHome(){
    let area = "전국";
    let sendData = {
        area:area,   
       }
	$.ajax({
        url:"GetVaccineMainData.do",   
        data:sendData,
        success:function(result){
            let addList = [result.firstCnt, result.secondCnt, result.totalFirstCnt, result.totalSecondCnt];
            $(".vaccineReservationFirst td").remove();  
			$(".vaccineReservationSecond td").remove();  
			                        
			$(".vaccineReservationFirst").append("<td class = 'firstTurn'><p>1차</p></td>");
			$(".vaccineReservationFirst").append("<td>"+ addList[0] +"</td>");
			$(".vaccineReservationFirst").append("<td>"+ addList[2] +"</td>");
			
			$(".vaccineReservationSecond").append("<td class = 'secondTurn'><p>2차</p></td>");
			$(".vaccineReservationSecond").append("<td>"+ addList[1] +"</td>");
			$(".vaccineReservationSecond").append("<td>"+ addList[3] +"</td>");
        }
    })
}


