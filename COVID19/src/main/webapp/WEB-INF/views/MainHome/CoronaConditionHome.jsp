<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/includeFile.jsp" %>
<link href="css/coronaLive.css" rel="stylesheet">
<script src="js/coronaLiveGetCoronaData.js" defer></script>
<script src="js/coronaLiveChart.js" defer></script>
<script src="js/chart.min.js" defer></script>
<body>
	<div id = "coronaLivePageBox">
		<div id = "darkModeBox">
			<p><span class="material-icons">dark_mode</span>다크모드</p>
			<button id = "modeBtn"></button>
		</div>
		<div id = "coronaLiveBox">
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
			<div id = "coronaGraphBox">
				<div id = "coronaOptionBox">
					<div>
						<label for="type">종류</label> 
						<select name="type" id="type" onChange="changeCoronaLiveCategory(); showCoronaData();">
							<option selected="selected">일별</option>
							<option>주별</option>
							<option>월별</option>
						</select> 
					</div>
					<div>
						<label for="period">기간</label> 
						<select name="period" id="period" onChange="showCoronaData()">
							<option selected="selected">1주</option>
							<option>2주</option>
							<option>1달</option>
							<option>3달</option>
							<option>1년</option>
							<option>전체</option>
						</select> 
					</div>
					<div>
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
				</div>
				<div id = "chartBox" style = "width:700px; height:400px;">
			       <canvas id="myChart"></canvas><!-- 차트를 그릴 공간 -->
			    </div>
			</div>
			<div id = "coronaAreaDataBox">
				<table>
		            <colgroup>
		               <col style="width:100px">
		               <col style="width:200px">
		               <col style="width:200px">
		               <col style="width:200px">
		            </colgroup>
		            <tbody id = "areaDataBox">
		               <tr>
		                  <th>지역</th>
		                  <th>오늘 확진자</th>
		                  <th>총 확진자</th>
		                  <th>총 사망자</th>
		               </tr>
		            </tbody>
		         </table>
			</div>
		</div>
	</div>
</body>
<%@ include file="../include/footer.jsp" %>
