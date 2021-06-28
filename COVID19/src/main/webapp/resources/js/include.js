const btnTop = $("#btnTop");

$(window).on("scroll", function(){         
    let st = $(window).scrollTop();        
    if(st > 0){                           
        btnTop.addClass("show");
    }
    else{                                 
        btnTop.removeClass("show");
    }
})

btnTop.on("click", function(){    
    gsap.to("html,body", {          
        scrollTop:0,              
        duration :1              
    })
})