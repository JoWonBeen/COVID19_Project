<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
<body>
<div id="largeBox">
	<div class="formBox">
		<h2>문의하기</h2>
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
						<th>아이디</th>
						<td>${replyBoardBean.memberId}</td>
						<th>조회수</th>
						<td>${replyBoardBean.readCount}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${replyBoardBean.subject}</td>
						<th>날짜</th>
						<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm" value = "${replyBoardBean.regDate}" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<div name="contents" id="contents" readonly>${replyBoardBean.contents}</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
<%-- 				<c:if test="${loggedMemberInfo.type == 3 }"> --%>
<%-- 					<a href="BoardRewriteForm.do?no=${replyBoardBean.no}&ref=${replyBoardBean.ref}&reStep=${replyBoardBean.reStep}&reLevel=${replyBoardBean.reLevel}" id="join">답글쓰기</a> --%>
<%-- 				</c:if> --%>
<%-- 					<a href="BoardModifyForm.do?no=${replyBoardBean.no}">수정</a> --%>
<%-- 					<a href="BoardDeleteForm.do?no=${replyBoardBean.no}">삭제</a> --%>
<!-- 				<a href="BoardList.do">목록</a> -->
				
				
				
				<c:choose>
                  <c:when test="${loggedMemberInfo.type == 3 && replyBoardBean.memberId == loggedMemberInfo.id}">
	                  <a href="BoardRewriteForm.do?no=${replyBoardBean.no}&ref=${replyBoardBean.ref}&reStep=${replyBoardBean.reStep}&reLevel=${replyBoardBean.reLevel}" id="join">답글쓰기</a>
					  <a href="BoardModifyForm.do?no=${replyBoardBean.no}">수정</a>
					  <a href="BoardDeleteForm.do?no=${replyBoardBean.no}">삭제</a>
					  <a href="BoardList.do">목록</a>
					  
                  </c:when>
                  <c:when test="${loggedMemberInfo.type == 3 && replyBoardBean.memberId != loggedMemberInfo.id}">
	                  <a href="BoardRewriteForm.do?no=${replyBoardBean.no}&ref=${replyBoardBean.ref}&reStep=${replyBoardBean.reStep}&reLevel=${replyBoardBean.reLevel}" id="join">답글쓰기</a>
                  	  <a href="BoardDeleteForm.do?no=${replyBoardBean.no}">삭제</a>
                  	  <a href="BoardList.do">목록</a>
                  </c:when>
                  <c:when test="${loggedMemberInfo.type != 3 && replyBoardBean.memberId == loggedMemberInfo.id}">
	                  <a href="BoardModifyForm.do?no=${replyBoardBean.no}">수정</a>
					  <a href="BoardDeleteForm.do?no=${replyBoardBean.no}">삭제</a>
					  <a href="BoardList.do">목록</a>
                  </c:when>
				  <c:otherwise>
                     <a href="BoardList.do">목록</a>
                  </c:otherwise>					                  
               </c:choose>
				
				
				
			</div>
		</form>
	</div>
	</div>
	<script>
	</script>
	<%@ include file="../include/footer.jsp" %>
</body>












