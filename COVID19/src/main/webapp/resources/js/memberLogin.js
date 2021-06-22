
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
	} else if($("#checkPassword").val().length<=0){
		alert("비밀번호를 한번 더 입력해주세요.");
		$("#checkPassword").focus();
		return;
	} else if($("#userPassword").val() != $("#checkPassword").val()){
		alert("비밀번호가 다릅니다.");
		$("#userPassword").val("");
		$("#checkPassword").val("");
		$("#userPassword").focus();
		return;
	} else if($("#userBirth").val().length<=0){
		alert("생년월일은 필수입니다.");
		$("#userBirth").focus();
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
	} else if($("#centerName").val().split(" ").length != 3){
		alert("센터명을 주소와 함께 정확하게 입력해주세요. ex) 서울시 강남구 oo병원");
		$("#centerName").focus();
		return;
	} else if($("#centerName").val().split(" ")[0].slice(-1) != "시"){
		alert("센터명을 주소와 함께 정확하게 입력해주세요. ex) 서울시 강남구 oo병원");
		$("#centerName").focus();
		return;
	} else if($("#centerName").val().split(" ")[1].slice(-1) != "구" && $("#centerName").val().split(" ")[1].slice(-1) != "군"){
		alert("센터명을 주소와 함께 정확하게 입력해주세요. ex) 서울시 강남구 oo병원");
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

function phoneFormat(el){
    el.value = el.value.replace(/(\d\d\d)(\d\d\d\d)(\d\d\d\d)/g, '$1-$2-$3');
}
function birthFormat(el){
	if (el.value.length == 6)
	    el.value = el.value.replace(/(\d\d)(\d\d)(\d\d)/g, '$1/$2/$3');
}



