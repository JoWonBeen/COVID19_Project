<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mediCenter.css">
<script src="js/mediCenterSearch.js" defer></script>
<script src="js/reserve.js" defer></script>
</head>
<body>
	<div id="mediCenterSearchBox">
		<div class="formBox">
			<header id="mediCenterheader">
				<p class="title">백신수량 검색</p>
			</header>
			<div class="contents">
				<!-- <select id="centerType" name="centerType">
					<option value="All">전체 의료기관</option>
					<option value="예방접종센터">예방접종 센터</option>
					<option value="위탁의료기관">위탁 의료기관</option>
				</select>  -->
				<select name="mainArea" id = "mainArea" onChange="changeAddressCategory(); resetHospital();">
	                <option selected="selected">광역시도</option>
	                <option>서울특별시</option>
	                <option>부산광역시</option>
	                <option>대구광역시</option>
	                <option>인천광역시</option>
	                <option>광주광역시</option>
	                <option>대전광역시</option>
	                <option>울산광역시</option>
	                <option>세종시</option>
	                <option>경기도</option>
	                <option>강원도</option>
	                <option>충청북도</option>
	                <option>충청남도</option>
	                <option>전라북도</option>
	                <option>전라남도</option>
	                <option>경상북도</option>
	                <option>경상남도</option>
	                <option>제주도</option>
	            </select>
	            <select name="detailArea" id = "detailArea" onChange = "resetHospital();">
	                <option selected="selected">시군구</option>
	            </select>
	            <input type="text" name="roadName" id="roadName" onkeyup="choiceHospital(this)" placeholder = "도로명을 입력하세요">
	            <select name="hospital" id = "hospital">
	                <option selected="selected">선택하세요</option>
	            </select>
				<input type="button" value="백신수량 확인하기" id="searchVacc">
				<p class="result">백신수량 검색결과</p>
				<hr>
				<table>
					<colgroup>
						<col style="width:400px">
						<col style="width:400px">
					</colgroup>	
					<tbody class="mediCenterList">

					</tbody>	
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>