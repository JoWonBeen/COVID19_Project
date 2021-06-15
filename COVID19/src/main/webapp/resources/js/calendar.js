let now = new Date(); // 오늘 날짜....2021 5 10
let first = new Date(now.getFullYear(),now.getMonth(),1); // 첫번째 날이 무슨 요일인지 확인하기 위해 
let dayList = ["SUN","MON","TUE","WED","THU","FRI","SAT"];
let monthList = ["january","february","march","april","may","june","july","august","september","october","november","december"];
let leapYear = [31,29,31,30,31,30,31,31,30,31,30,31];
let notLeapYear = [31,28,31,30,31,30,31,31,30,31,30,31];
let pageFirst = first; //클릭하고 넘어갈떄 
let pageYear;

let dateList = [];
let pickedDate=""; // 클릭한 날짜 뽑기
let pickedDay =""; //클릭한 요일

let queryDate="";

//showCalendar(2021,5);
//4로 떨어지면 윤년 100으로 떨어지면 윤년 아님 400으로 떨어지면 윤년
function showCalendar(pYear, pMonth) {
    first = new Date(pYear,pMonth);
    let firstYear = first.getFullYear();
    let month = monthList[pMonth];
    if(firstYear % 4 === 0){
        if(firstYear%100===0){
            pageYear = notLeapYear;    
        } else {
            pageYear = leapYear;
        }
    } else {
        pageYear = notLeapYear;
    }
    if(firstYear % 400===0){
        pageYear = leapYear;
    }
    $(".monthTitle .year").text(pYear);
    $(".monthTitle .month").text(monthList[pMonth]);

    let count = 1;
    $("#dates .itemList").html("");
    //6줄 이상 못나옴... 6*7
    for(let i = 0;i<42;i++){
        if(i<first.getDay()){
            $("#dates .itemList").append(`<li class="blank"><span></span></li>`);
        } else {
            $("#dates .itemList").append(`<li data-num=${count}><span>${count}</span></li>`);
            if(count===now.getDate()){
                $(`#dates .itemList li:nth-child(${i+1})`).addClass("on");
            }
            count++;
        }
        //조건을 달지 않으면 42까지 출력됨.
        if(count > pageYear[first.getMonth()]){
            break;
        }
    }
    gsap.fromTo("#dates .itemList li",{scale:0},{
                                                    scale:1,
                                                    ease:"power4",
                                                    stagger:{
                                                        each:0.02
                                                    }
                });
    pickedDay = dayList[now.getDay()];
    pickedDate = now.getDate();
    $("#pickedDay").text(pickedDay);
    $("#pickedDate").text(pickedDate);
            
   
}
showCalendar(now.getFullYear(),now.getMonth());

$(".btnNextMonth").on("click",function(){
    if(now.getMonth() + 1 === 12){
        now = new Date(now.getFullYear()+1,0,now.getDate());
    } else {
        now = new Date(now.getFullYear(),now.getMonth()+1,now.getDate());
    }
    showCalendar(now.getFullYear(),now.getMonth());
});
$(".btnPrevMonth").on("click",function(){
    if(now.getMonth() - 1 === -1){
        now = new Date(now.getFullYear()-1,11,now.getDate());
    } else {
        now = new Date(now.getFullYear(),now.getMonth()-1,now.getDate());
    }
    showCalendar(now.getFullYear(),now.getMonth());
});
$("body").on("click","#dates li",function(){
    //console.log($(this).data("num"));
    let clickedDate = $(this).data("num");
    now = new Date(now.getFullYear(), now.getMonth(),clickedDate);
    //showCalendar(now.getFullYear(), now.getMonth());
    
    //$(this).addClass("on").siblings().removeClass("on");
    pickedDay = dayList[now.getDay()];
    pickedDate = now.getDate();
    console.log(pickedDay);
    console.log(pickedDate);
    
    $("#pickedDay").text(pickedDay);
    $("#pickedDate").text(pickedDate);
    $(this).addClass("on");
    $(this).siblings().removeClass("on");
    
});


