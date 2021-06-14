
let id_check = 0;
$("#memberJoin").on("click", function(){
	if($("#userID").val().length <= 0){
		alert("ID는 필수입니다.");
		$("#userID").focus();
		return;
	} else if($("#userName").val().length<=0){
		alert("이름는 필수입니다.");
		$("#userName").focus();
		return;
	} else if($("#userPassword").val().length<=0){
		alert("비밀번호는 필수입니다.");
		$("#userPassword").focus();
		return;
	} else if($("#userBirth").val().length<=0){
		alert("생년월일은 필수입니다.");
		$("#userBirth").focus();
		return;
	} else if($("#userAge").val().length<=0){
		alert("나이는 필수입니다.");
		$("#userAge").focus();
		return;
	} else if($("#gender").val().length<=0){
		alert("성별은 필수입니다.");
		$("#gender").focus();
		return;
	} else if($("#userPhone").val().length<=0){
		alert("연락처는 필수입니다.");
		$("#userPhone").focus();
		return;
	} else if(id_check == 0){
		alert("아이디 중복체크를 해주세요.");				
	} else{
		$("#joinForm").submit();
	}
})

$("#memberIdCheck").on("click", function(){
	let id = $("#userID").val();
				
	$.ajax({
		url:"MemberIdCheck.do?id="+id,
		success:function(data){
			let resultMember = data.resultMember;
			let resultAdmin = data.resultAdmin;
			if ($("#userID").val().length <= 0){
				alert("ID는 필수입니다.");
				$("#userID").focus();
			} else if (resultMember > 0 || resultAdmin > 0){
				alert("이미 사용중인 아이디입니다.");
				$("#userID").val("");
				$("#userID").focus();
				
			} else{
				let check = confirm("사용가능한 아이디입니다.", "사용하시겠습니까?");
				if(check){
					$("#userID").attr("readonly", true);
					id_check = 1;
				} else{
					$("#userID").val("");
					$("#userID").focus();
				}
			}
		}
	});
	
	return false;
});



$("#adminJoin").on("click", function(){
	if($("#userID").val().length <= 0){
		alert("ID는 필수입니다.");
		$("#userID").focus();
		return;
	} else if($("#userName").val().length<=0){
		alert("이름는 필수입니다.");
		$("#userName").focus();
		return;
	} else if($("#userPassword").val().length<=0){
		alert("비밀번호는 필수입니다.");
		$("#userPassword").focus();
		return;
	} else if($("#centerName").val().length<=0){
		alert("센터 정보는 필수입니다.");
		$("#centerName").focus();
		return;
	} else if($("#userPhone").val().length<=0){
		alert("연락처는 필수입니다.");
		$("#userPhone").focus();
		return;
	} else if(id_check == 0){
		alert("아이디 중복체크를 해주세요.");				
	} else{
		$("#joinForm").submit();
	}
})

$("#adminIdCheck").on("click", function(){
	let id = $("#userID").val();
	$.ajax({
		url:"MemberIdCheck.do?id="+id,
		success:function(data){
			let resultMember = data.resultMember;
			let resultAdmin = data.resultAdmin;
			if ($("#userID").val().length <= 0){
				alert("ID는 필수입니다.");
				$("#userID").focus();
			} else if (resultMember > 0 || resultAdmin > 0){
				alert("이미 사용중인 아이디입니다.");
				$("#userID").val("");
				$("#userID").focus();
			} else{
				let check = confirm("사용가능한 아이디입니다.", "사용하시겠습니까?");
				if(check){
					$("#userID").attr("readonly", true);
					id_check = 1;
				} else{
					$("#userID").val("");
					$("#userID").focus();
				}
			}
		}
	});
	
	return false;
});


function goLogin(memberType){
    if (memberType == null) {
	    alert("로그인이 필요합니다");
	    location.href = "LoginForm.do";
    } 
} 

