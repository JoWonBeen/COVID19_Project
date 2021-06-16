<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<link rel="stylesheet" href="css/reservation.css">
<link rel="stylesheet" href="css/reset.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<body>
	<div class="formBox" id="list">
		<h2>예약자 현황</h2>
		<table>
			<colgroup>
				<col style="width: 200px">
				<col style="width: 200px">
				<col style="width: 250px">
				<col style="width: 250px">
				
			</colgroup>
			<thead>
				<tr>
					<th>NO</th>
					<th>ID</th>
					<th>NAME</th>
					<th>DATE</th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td>${loggedMemberInfo.no}</td>
						<td>${loggedMemberInfo.id}</td>
						<td><a href="ReserveInfo.do?no=${loggedMemberInfo.no }">${loggedMemberInfo.name}</a></td>
						<td><fmt:formatDate pattern = "yyyy-mm-dd hh:mm" value = "${reserveBean.regDate}" />${reserveBean.regDate}</td>
					</tr>
			</tbody>
		</table>
		
		<div class="pagination">
			<c:if test = "${startPage > pageGroup }">
				<a href="ReserveList.do?clickedPage=${startPage - pageGroup}">
					<span class="material-icons">navigate_before</span>
				</a>								
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" varStatus="status">
				<c:choose>
					<c:when test = "${currentPage == i }">
						<a href="ReserveList.do?clickedPage=${i}" class = "clicked">${i}</a>								
					</c:when>
					<c:otherwise>
						<a href="ReserveList.do?clickedPage=${i}">${i}</a>								
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test = "${endPage < paginationTotal }">
				<a href="ReserveList.do?clickedPage=${startPage + pageGroup}">
					<span class="material-icons">navigate_next</span>
				</a>								
			</c:if>
			
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>








