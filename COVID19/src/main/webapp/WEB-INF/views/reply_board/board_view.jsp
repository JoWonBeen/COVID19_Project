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
	<div class="formBox">
		<h2>자유게시판</h2>
		<form id="joinForm" method="POST">
			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:350px">
					<col style="width:150px">
					<col style="width:350px">
				</colgroup>
				<tbody>
					<tr>
						<th>성명</th>
						<td>${loggedMemberInfo.name}</td>
						<th>HIT</th>
						<td>${replyBoardBean.readCount}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${replyBoardBean.email}</td>
						<th>DATE</th>
						<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm" value = "${replyBoardBean.regDate}" /></td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">${replyBoardBean.subject}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<div name="contents" id="contents" readonly>${replyBoardBean.contents}</div>
						</td>
					</tr>
				</tbody>
			</table>
<!-- 			<div class="btns"> -->
<%-- 			<c:choose> --%>
<%-- 			<c:when test="${loggedMemberInfo!=null }"> --%>
<%-- 				<a href="BoardModifyForm.do?no=${replyBoardBean.no}">수정</a> --%>
<%-- 				<a href="BoardDeleteForm.do?no=${replyBoardBean.no}">삭제</a> --%>
<%-- 			</c:when> --%>
<%-- 			<c:when test = "${adminBean.type.val() == 2}"> --%>
<%-- 			<a href="BoardRewriteForm.do?no=${replyBoardBean.no}&ref=${replyBoardBean.ref}&reStep=${replyBoardBean.reStep}&reLevel=${replyBoardBean.reLevel}" id="join">답글쓰기</a> --%>
<%-- 			</c:when> --%>
<%-- 			</c:choose> --%>
<!-- 			<a href="BoardList.do">목록</a> -->
<!-- 			</div> -->
			
			<div class="btns">
				<c:if test="${loggedMemberInfo!=null }">
					<a href="BoardRewriteForm.do?no=${replyBoardBean.no}&ref=${replyBoardBean.ref}&reStep=${replyBoardBean.reStep}&reLevel=${replyBoardBean.reLevel}" id="join">답글쓰기</a>
					<a href="BoardModifyForm.do?no=${replyBoardBean.no}">수정</a>
					<a href="BoardDeleteForm.do?no=${replyBoardBean.no}">삭제</a>
				</c:if>
				<a href="BoardList.do">목록</a>
			</div>
		</form>
	</div>
	<script>
	</script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>












