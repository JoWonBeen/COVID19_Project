<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
<body>
<div id="largeBox">
	<div class="formBox">
		<h2>문의게시판</h2>
			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:500px">
				</colgroup>
				<tbody>
					<tr>
						<th style="border: 1px solid #d9d9d9; background-color: #f8f8f8;">아이디</th>
						<td style="border: 1px solid #d9d9d9; ">${replyBoardBean.memberId}</td>
					</tr>
					<tr>
						<th style="border: 1px solid #d9d9d9; background-color: #f8f8f8;">제목</th>
						<td style="border: 1px solid #d9d9d9;">${replyBoardBean.subject}</td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" value="${replyBoardBean.no}" name = "no" class="no">
				<input type="button" value="삭제" id="join">
				<a href="BoardList.do">목록</a>
			</div>
	</div>
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












