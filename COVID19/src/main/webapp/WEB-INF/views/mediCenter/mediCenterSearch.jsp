<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mediCenter.css">
<script src="js/mediCenterGetData.js" defer></script>
<script src="js/mediCenterSearch.js" defer></script>
</head>
<body>
	<div id="mediCenterSearchBox">
		<div class="formBox">
			<header id="mediCenterheader">
				<p class="title">의료기관 검색</p>
			</header>
			<div class="contents">
				<select id="centerType" name="centerType">
					<option value="All">전체 의료기관</option>
					<option value="예방접종센터">예방접종 센터</option>
					<option value="위탁의료기관">위탁 의료기관</option>
				</select> 
				<select id="sido" name="sido" onchange="changeCategory(this)">
					<option value="광역시도">광역시도</option>
					<option value="서울특별시">서울특별시</option>
					<option value="부산">부산광역시</option>
					<option value="대구">대구광역시</option>
					<option value="인천">인천광역시</option>
					<option value="광주">광주광역시</option>
					<option value="대전">대전광역시</option>
					<option value="울산">울산광역시</option>
					<option value="세종">세종특별자치시</option>
					<option value="경기">경기도</option>
					<option value="강원">강원도</option>
					<option value="충북">충청북도</option>
					<option value="충남">충청남도</option>
					<option value="전북">전라북도</option>
					<option value="전남">전라남도</option>
					<option value="경북">경상북도</option>
					<option value="경남">경상남도</option>
					<option value="제주">제주특별자치도</option>
				</select>
				<select id="sigungu" name="sigungu">
					<option value="시군구">시군구</option>
				</select>
				<input type="text" id="roadName" name="roadName" placeholder="도로명을 입력하세요">
				<input type="button" value="의료기관 찾기" id="search">
				<p class="result">의료기관 검색 결과</p>
				<hr>
				<table>
					<colgroup>
						<col style="width:400px">
						<col style="width:400px">
					</colgroup>	
					<tbody class="mediCenterList">
						<!-- <tr>
							<td colspan= "2">의료기관 검색결과</td>
						</tr> -->
					</tbody>	
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>