<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="css/include.css">
<link rel="stylesheet" href="css/reset.css">
<link href="css/coronaLive.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/coronaLive.js" defer></script>
</head>
<body>
	<div id = "coronaOptionBox">
		<label for="type">종류</label> 
		<select name="type" id="type" onChange="changeCategory();">
			<option selected="selected">일별</option>
			<option>주별</option>
			<option>월별</option>
		</select> 
		
		<label for="period">기간</label> 
		<select name="period" id="period" onChange="showCoronaData()">
			<option selected="selected">1주</option>
			<option>2주</option>
			<option>1달</option>
			<option>3달</option>
			<option>1년</option>
			<option>전체</option>
			
		</select> 
		<label for="area">지역</label> 
		<select name="area" id="area" onChange="showCoronaData()">
			<option selected="selected">전체</option>
			<option>서울</option>
			<option>부산</option>
			<option>인천</option>
			<option>대구</option>
			<option>광주</option>
			<option>대전</option>
			<option>울산</option>
			<option>세종</option>
			<option>경기</option>
			<option>강원</option>
			<option>충북</option>
			<option>충남</option>
			<option>경북</option>
			<option>경남</option>
			<option>전북</option>
			<option>전남</option>
			<option>제주</option>
		</select>
	</div>


</body>
</html>