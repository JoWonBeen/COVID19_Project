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
					<col style="width: 200px">
					<col style="width: 800px">
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
				<input type="button" value="수정" id="boardModifyBtn">
				<a href="BoardList.do">목록</a>
			</div>

	</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script>

	$("#boardModifyBtn").on("click", function(){
		if($("#subject").val().length <= 0){
			alert("제목은 필수입니다.");
			$("#subject").focus();
			return;
		} else if($("#contents").val().length<=0){
			alert("내용은 필수입니다.");
			$("#contents").focus();
			return;
		}else{
			let check = confirm("수정하시겠습니까?");
			let boardNo = $(".no").val();
			let subject = $("#subject").val();
			let contents = $("#contents").val();
			if(check == true){
				location.href = "BoardModify.do?no="+boardNo+"&subject="+subject+"&contents="+contents;
			}
		}
	})
	
	</script>
</body>












