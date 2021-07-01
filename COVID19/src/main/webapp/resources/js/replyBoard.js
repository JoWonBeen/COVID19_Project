$("#largeBox #boardWriteBtn").on("click", function(){
	if($("#subject").val().length <= 0){
		alert("제목은 필수입니다.");
		$("#subject").focus();
		return;
	} else if($("#contents").val().length<=0){
		alert("내용은 필수입니다.");
		$("#contents").focus();
		return;
	}else{
		$("#writeForm").submit();
	}
})