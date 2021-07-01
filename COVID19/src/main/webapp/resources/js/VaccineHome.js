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
			                        
			$(".vaccineReservationFirst").append("<td>1차</td>");
			$(".vaccineReservationFirst").append("<td>"+ addList[0] +"</td>");
			$(".vaccineReservationFirst").append("<td>"+ addList[2] +"</td>");
			
			$(".vaccineReservationSecond").append("<td>2차</td>");
			$(".vaccineReservationSecond").append("<td>"+ addList[1] +"</td>");
			$(".vaccineReservationSecond").append("<td>"+ addList[3] +"</td>");
        }
    })
}


