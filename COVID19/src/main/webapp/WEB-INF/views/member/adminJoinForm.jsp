<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<body>
	<div class="formBox">
		<h2>회원가입</h2>
		<form action="AdminJoin.do?type=2" id="joinForm" method="POST">
			<table>
				<colgroup>
					<col style="width: 150px">
					<col style="width: 850px">
				</colgroup>
				<tbody>
					<tr>
						<th>ID</th>
						<td><input type="text" name="id" id="userID">
							<button id="btnIdCheck">중복확인</button>
						</td>
					</tr>
					<tr>
						<th>NAME</th>
						<td><input type="text" name="name" id="userName" value=""></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password" id="userPassword"></td>
					</tr>
					<tr>
						<th>Center Name</th>
						<td><input type="text" name="centerName" id="centerName"></td>	
					</tr>
					<tr>
						<th>PHONE</th>
						<td><input type="text" name="phone" id="userPhone"></td>
					</tr>
	
				</tbody>
			</table>
			<div class="btns">
				<input type="button" value="회원가입" id="join"> 
				<input type="reset" value="취소" id="cancel"> 
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp"%>

	<script type="text/javascript">
		let id_check = 0;
 		$("#join").on("click", function(){
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

		$("#btnIdCheck").on("click", function(){
			let id = $("#userID").val();
			$.ajax({
				url:"AdminIdCheck.do?id="+id,
				success:function(data){
					let result = data.result;
					if ($("#userID").val().length <= 0){
						alert("ID는 필수입니다.");
						$("#userID").focus();
					} else if (result > 0){
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
	</script>
</body>
</html>