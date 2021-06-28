<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="css/coronaInfoLayout.css">
<title>Insert title here</title>
<script src="js/vaccineStatusGetData.js" defer></script>
<script src="js/vaccineStatus.js" defer></script>
</head>
<body>
    <div class = "container">
        <h1 class="mainMenu">COVID19 정보</h1>
	    <h2 class="subMenu">백신 접종 현황</h2>
        <div class="contents">
                <div id = "vaccineTotalDataBox">
                    <table>
                        <colgroup>
                           <col style="width:200px">
                           <col style="width:200px">
                           <col style="width:200px">
                           <col style="width:200px">
                        </colgroup>
                        <tbody>
                           <tr id = "totalDataNameBox">
                              <th>추가 1차접종자</th>
                              <th>추가 접종완료자</th>
                              <th>1차접종자</th>
                              <th>접종완료자</th>
                           </tr>
                           <tr id = "vaccTotalDataBox">
                           </tr>
                        </tbody>
                     </table>
                </div>
                <div id = "vaccineGraphBox">
                    <div id = "vaccineOptionBox">
                        <div>
                            <label for="type">종류</label> 
                            <select name="type" id="type" onChange="changeCategory(); showVaccineData();">
                                <option selected="selected">일별</option>
                                <option>주별</option>
                                <option>월별</option>
                            </select> 
                        </div>
                        <div>
                            <label for="period">기간</label> 
                            <select name="period" id="period" onChange="showVaccineData()">
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
                            <select name="area" id="area" onChange="showVaccineData()">
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
                <div id = "vaccineAreaDataBox">
                    <table>
                        <colgroup>
                           <col style="width:100px">
                           <col style="width:200px">
                           <col style="width:200px">
                           <!-- <col style="width:200px"> -->
                        </colgroup>
                        <tbody id = "areaDataBox">
                           <tr>
                              <th>지역</th>
                              <th>오늘 추가접종자</th>
                              <th>총 접종완료</th>
                           </tr>
                        </tbody>
                     </table>
                </div>
        </div>
    </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>