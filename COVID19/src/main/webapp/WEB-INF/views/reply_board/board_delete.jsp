<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
<body>
	<div class="formBox">
		<h2>문의게시판</h2>
<!-- 		<form id="joinForm" method="POST" action="BoardDelete.do"> -->
			<table>
				<colgroup>
					<col style="width: 150px">
					<col style="width: 850px">
				</colgroup>
				<tbody>
					<tr>
						<th>ID</th>
						<td>${replyBoardBean.memberId}</td>
					</tr>
					<tr>
						<th>SUBJECT</th>
						<td>${replyBoardBean.subject}</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th>PASSWORD</th> -->
<!-- 						<td><input type="password" name="password" id="userPassword"></td> -->
<!-- 					</tr> -->
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" value="${replyBoardBean.no}" name = "no" class="no">
				<input type="button" value="삭제" id="join">
				<a href="BoardList.do">목록</a>
			</div>
<!-- 		</form> -->
	</div>
	<%@ include file="../include/footer.jsp" %>
<script>
	let boardNo = $(".no").val();
	$("#join").on("click", function(){
		let check = confirm("진짜 삭제하시겠습니까?");
		if(check == true){
			
			location.href = "BoardDelete.do?no="+boardNo;
		}
	})
</script>
</body>
</html>












