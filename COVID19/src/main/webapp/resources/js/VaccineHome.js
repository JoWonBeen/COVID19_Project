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

