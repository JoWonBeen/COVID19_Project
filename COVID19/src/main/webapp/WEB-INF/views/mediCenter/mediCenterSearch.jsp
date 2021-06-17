<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/mediCenter.js" defer></script>
</head>
<body>
	<div id="mediCenter">
		<header id="header" class="header">
			<h1>
				<span class="title">의료기관 검색</span>
			</h1>
		</header>
		<main id="main">
			<select>
				<option>전체 의료기관</option>
				<option value="a">예방접종센터</option>
				<option value="b">위탁 의료기관</option>
			</select> 
			<select id="sido" onchange="categoryChange(this)">
				<option>광역시도</option>
				<option value="">서울특별시</option>
				<option value="">부산광역시</option>
				<option value="">대구광역시</option>
				<option value="">인천광역시</option>
				<option value="">광주광역시</option>
				<option value="">대전광역시</option>
				<option value="">울산광역시</option>
				<option value="">세종특별자치시</option>
				<option value="">경기도</option>
				<option value="">강원도</option>
				<option value="">충청북도</option>
				<option value="">충청남도</option>
				<option value="">전라북도</option>
				<option value="">전라남도</option>
				<option value="">경상북도</option>
				<option value="">경상남도</option>
				<option value="">제주특별자치도</option>
			</select>
			<select>
				<option value="">시군구</option>
			</select>

			<ul class="mediCenterList">

			</ul>
		</main>
	</div>
</body>
</html>