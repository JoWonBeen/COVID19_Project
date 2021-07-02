<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ include file="../include/header.jsp" %>
<body>
<div id="largeBox">
	<div class="formBox">
		<h2>문의게시판</h2>
		<form action="BoardRewrite.do" id="joinForm" method="POST">
			<table>
				<colgroup>
					<col style="width:150px">
					<col style="width:850px">
				</colgroup>
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="memberId" id="userId" value="${loggedMemberInfo.id }"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" id="subject" value="[답글입니다]"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea name="contents" id="contents"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="hidden" value="${replyBoardBean.no}" name = "no" class="no">
				<input type="hidden" name="ref" class="ref" value="${replyBoardBean.ref}">
				<input type="hidden" name="reStep" class="reStep" value="${replyBoardBean.reStep}">
				<input type="hidden" name="reLevel" class="reLevel" value="${replyBoardBean.reLevel}">
				<input type="submit" value="확인" id="join">
				<input type="reset" value="취소" id="cancel">
				<a href="BoardList.do">목록</a>
			</div>
		</form>
	</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	
</body>












