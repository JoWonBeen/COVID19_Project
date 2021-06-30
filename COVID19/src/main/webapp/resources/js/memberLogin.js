
let id_check = 0;
let pw_pattern1 = /[0-9]/;
let pw_pattern2 = /[a-zA-Z]/;
let pw_pattern3 = /[~!@#$%^&*()~]/;


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
<<<<<<< HEAD
=======
	} else if(!pw_pattern1.test($("#userPassword").val())||!pw_pattern2.test($("#userPassword").val())||!pw_pattern3.test($("#userPassword").val())||$("#userPassword").val().length<=7){
		alert("비밀번호는 영문, 숫자, 특수문자를 포함한 8자 이상이 되어야합니다.");
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
>>>>>>> JoWonBeen_master_merge
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
		return;				
	} else{
		$("#joinForm").submit();
	}
})

$("#memberIdCheck").on("click", function(){
	let id = $("#userID").val();
	if(id == "system"){
		alert("이미 사용중인 아이디입니다.");
		$("#userID").val("");
		$("#userID").focus();
		return false;
	}			
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
	} else if(!pw_pattern1.test($("#userPassword").val())||!pw_pattern2.test($("#userPassword").val())||!pw_pattern3.test($("#userPassword").val())||$("#userPassword").val().length<=7){
		alert("비밀번호는 영문, 숫자, 특수문자를 포함한 8자 이상이 되어야합니다.");
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
	} else if($("#mainArea").val() == "선택하세요"){
		alert("주소 선택은 필수입니다.");
		return;
	} else if($("#detailArea").val() == "선택하세요"){
		alert("주소 선택은 필수입니다.");
		return;
	} else if($("#roadName").val().length<=0){
		alert("도로명은 필수입니다.");
		return;
	} else if($("#hospital").val() == null){
		alert("선택하신 주소에 해당하는 병원이 없습니다. 다른 주소를 선택해주세요.");
		return;
	} else if($("#hospital").val() == "선택하세요"){
		alert("병원 선택은 필수입니다.");
		return;
	} else if($("#userPhone").val().length<=0){
		alert("연락처는 필수입니다.");
		$("#userPhone").focus();
		return;
	} else if(id_check == 0){
		alert("아이디 중복체크를 해주세요.");
		return;				
	} else{
		$("#joinForm").submit();
		
	}
})

$("#adminIdCheck").on("click", function(){
	let id = $("#userID").val();
	if(id == "system"){
		alert("이미 사용중인 아이디입니다.");
		$("#userID").val("");
		$("#userID").focus();
		return false;
	}
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

<<<<<<< HEAD
=======
function phoneFormat(el){
    el.value = el.value.replace(/(\d\d\d)(\d\d\d\d)(\d\d\d\d)/g, '$1-$2-$3');
}
function birthFormat(el){
	if (el.value.length == 6)
	    el.value = el.value.replace(/(\d\d)(\d\d)(\d\d)/g, '$1/$2/$3');
}


window.onload = function(){
  engAndNumberFunc(document.getElementById("userID"));
}

function engAndNumberFunc(t){
  var regexp = /[^a-z0-9]/gi;
  t.onkeyup = function(e){
    var v = this.value;
    this.value = v.replace(regexp,'');
  }
}



>>>>>>> JoWonBeen_master_merge
