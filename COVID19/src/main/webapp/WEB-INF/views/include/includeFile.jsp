
<!-- 메뉴바 없이 css나 js만 적용하기 위한 include 파일 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COVID19 Reservation</title>
<link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/include.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/memberInfoForm.css">
<link rel="stylesheet" href="css/mainHome.css">
<script src="js/jquery-3.6.0.min.js"></script> 
<script src="js/memberLogin.js" defer></script>
<script src="js/reserve.js" defer></script>
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
	</header>