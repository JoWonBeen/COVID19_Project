


$(".use").on("click", function(){
	let useCnt = $(this).siblings("input[name=useVaccine]").val();
	let resultCnt = $(this).siblings("input[name=vaccineType]").val() - useCnt;
	if(resultCnt < 0){
		alert("수량이 부족합니다.");
	} else{	
		$(this).siblings("input[name=vaccineType]").val(resultCnt);
	}
	$(this).siblings("input[name=useVaccine]").val("0");
	return false;
})
$(".add").on("click", function(){
	let useCnt = $(this).siblings("input[name=addVaccine]").val();
	let resultCnt = Number($(this).siblings("input[name=vaccineType]").val()) + Number(useCnt);
	$(this).siblings("input[name=vaccineType]").val(resultCnt);
	$(this).siblings("input[name=addVaccine]").val("0");
	return false;
})
$(".up").on("click", function(){
	let resultCnt = Number($(this).siblings("input[name=vaccineType]").val()) + 1;
	$(this).siblings("input[name=vaccineType]").val(resultCnt);
	return false;
})
$(".down").on("click", function(){
	let resultCnt = Number($(this).siblings("input[name=vaccineType]").val()) - 1;
	if(resultCnt < 0){
		alert("수량이 부족합니다.");
	} else{
		$(this).siblings("input[name=vaccineType]").val(resultCnt);
	}
	return false;
})