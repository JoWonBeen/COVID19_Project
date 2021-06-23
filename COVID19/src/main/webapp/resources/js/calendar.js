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
        if(count > pageYear[first.getMonth()]){
            break;
        }
    }
queryDate = `${now.getFullYear()}-${now.getMonth()+1}-${now.getDate()}`;
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
    let clickedDate = $(this).data("num");
    now = new Date(now.getFullYear(), now.getMonth(),clickedDate);
    showCalendar(now.getFullYear(), now.getMonth());
    pickedDay = dayList[now.getDay()];
    pickedDate = now.getDate();
    $("#pickedDay").text(pickedDay);
    $("#pickedDate").text(pickedDate);
   	queryDate = `${now.getFullYear()}-${now.getMonth()+1}-${now.getDate()}`;
    const sendData = {
        pickedDate:queryDate
    };
    
});


