<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/include.css">
<link rel="stylesheet" href="css/reset.css">
<script src="js/jquery-3.6.0.min.js"></script> 

<header id="header">
    <c:choose>
		<c:when test="${loggedMemberInfo.type == 1 || loggedMemberInfo == null}">
			<h1 id="logo">
		        <a href="Index.do"><img src="images/logoMember.png" alt=""> </a>
		    </h1>
		</c:when>
		<c:otherwise>
			<h1 id="logo">
		        <a href="Index.do"><img src="images/logoAdmin.png" alt=""> </a>
		    </h1>
		</c:otherwise>
	</c:choose>
	<h2 style = "text-align:center; font-size:50px; margin-top:30px; color:blue;">Corona Live</h2>
</header>
</head>
</html>