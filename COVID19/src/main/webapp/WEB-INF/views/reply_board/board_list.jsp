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
	<div class="formBox" id="list">
		<h2>문의게시판</h2>
		<table>
			<colgroup>
				<col style="width: 100px">
				<col style="width: 700px">
				<col style="width: 200px">
				<col style="width: 300px">
				<col style="width: 20px">
			</colgroup>
			<thead>
				<tr>
					<th>NO</th>
					<th>SUBJECT</th>
					<th>ID</th>
					<th>DATE</th>
					<th>HIT</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="replyBoardBean"  items="${replyBoardList}" 
				                                 begin="0" 
				                                 end="${replyBoardList.size()}" 
				                                 step="1" 
				                                 varStatus="status">
					<tr>
						<td>${numbering - status.index}</td>
						<td class="subject space${replyBoardBean.reStep }">
							<c:if test = "${replyBoardBean.reStep > 1 }">
								<img src = "images/re.svg">
							</c:if>
							<a href="BoardView.do?no=${replyBoardBean.no }&memberId=${replyBoardBean.memberId}&type=${loggedMemberInfo.type}">${replyBoardBean.subject}</a>
						</td>
						
						<td>${replyBoardBean.memberId}</td>
						<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm" value = "${replyBoardBean.regDate}" /></td>
						<td>${replyBoardBean.readCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="pagination">
			<c:if test = "${startPage > pageGroup }">
				<a href="BoardList.do?clickedPage=${startPage - pageGroup}">
					<span class="material-icons">navigate_before</span>
				</a>								
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" varStatus="status">
				<c:choose>
					<c:when test = "${currentPage == i }">
						<a href="BoardList.do?clickedPage=${i}" class = "clicked">${i}</a>								
					</c:when>
					<c:otherwise>
						<a href="BoardList.do?clickedPage=${i}">${i}</a>								
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test = "${endPage < paginationTotal }">
				<a href="BoardList.do?clickedPage=${startPage + pageGroup}">
					<span class="material-icons">navigate_next</span>
				</a>								
			</c:if>
			
		</div>
		<c:if test="${loggedMemberInfo!=null }">
			<div class="btns">
				<a href="BoardWriteForm.do" id="join">글쓰기</a>
			</div>
		</c:if>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>








