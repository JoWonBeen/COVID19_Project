<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<body>
	<div id = "mainVisualBox">
		<div id = "coronaTotalDataBox">
			<table>
	            <colgroup>
	               <col style="width:200px">
	               <col style="width:200px">
	               <col style="width:200px">
	               <col style="width:200px">
	            </colgroup>
	            <tbody>
	               <tr id = "totalDataNameBox">
	                  <th>총 확진자</th>
	                  <th>사망자</th>
	                  <th>완치자</th>
	                  <th>오늘 확진자</th>
	               </tr>
	               
	               <tr id = "totalDataBox">
	               </tr>
	            </tbody>
	         </table>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>