$("#reserveForm #reserve").on("click",function(){
    if($("#gubun").val().length<=0) {
        alert("대상자 구분은 필수 입력 사항입니다.");
        $("#gubun").focus();
        return;
    }else if($("#vaccine").val().length<=0){
        alert("백신은 필수 입력 사항입니다.");
        $("#vaccine").focus();
    } else if($("#mainArea").val().length<=0){
        alert("시도별 선택은 필수 입력 사항입니다.");
        $("#mainArea").focus();
        return;
    } else if($("#detailArea").val().length<=0){
        alert("시군구별 선택은 필수 입력 사항입니다.");
        $("#detailArea").focus();
        return;
    } else if($("#hospital").val().length<=0){
        alert("병원은 필수 입력 사항입니다.");
        $("#hospital").focus();
        return;
    } else if($("#datepicker").val().length<=0){
        alert("날짜는 필수 입력 사항입니다.");
        $("#datepicker").focus();
        return;
    } else if($("#hour").val().length<=0){
        alert("예약시간은 필수 입력 사항입니다.");
        $("#hour").focus();
        return;
    } else if($("#minute").val().length<=0){
        alert("예약시간은 필수 입력 사항입니다.");
        $("#minute").focus();
        return;
    }else {
        $("#reserveForm").submit();
    }
});