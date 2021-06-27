<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="css/reservation.css">
<link rel="stylesheet" href="css/reset.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<body>
<div id="largeBox">
	<div class="formBox">
		<h2>문의게시판</h2>
			<table>
				<colgroup>
					<col style="width: 200px">
					<col style="width: 1300px">
				</colgroup>
				<tbody>
					<tr>
						<th>성명</th>
						<td><input type="text" name="name" id="userName" value="${loggedMemberInfo.name}"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" id="subject" value="${replyBoardBean.subject}"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="contents" id="contents">${replyBoardBean.contents}</textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" value="${replyBoardBean.no}" name = "no" class="no">
				<input type="button" value="수정" id="join">
				<a href="BoardList.do">목록</a>
			</div>

	</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script>

	$("#join").on("click", function(){
		let check = confirm("수정하시겠습니까?");
		let boardNo = $(".no").val();
		let subject = $("#subject").val();
		let contents = $("#contents").val();
		if(check == true){
			location.href = "BoardModify.do?no="+boardNo+"&subject="+subject+"&contents="+contents;
		}
	})
	</script>
</body>
</html>












