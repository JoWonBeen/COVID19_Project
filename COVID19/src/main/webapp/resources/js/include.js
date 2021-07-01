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

Number.prototype.format = function(){
    if(this==0) return 0;
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
    return n;
};
 
String.prototype.format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";
    return num.format();
};