<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<body>
    <div id="vaccinationStatusBox"> 
        <div class="formBox">
            <div class="menuBox">
                <p class="mainMenu">COVID19 정보</p>
                <p class="subMenu">백신 접종 현황</p>
            </div>
            <div class="contents">
                <div id= "vaccineTotalDataBox">
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
                <div id= "vaccineGraphBox">
                    <div id="vaccineOptionBox">
                        <div>
                            <label for="type">종류</label> 
                            <select name="type" id="type" onChange="changeVaccineCategory(); showVaccineData();">
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
                                <option value="서울특별시">서울</option>
                                <option value="부산광역시">부산</option>
                                <option value="인천광역시">인천</option>
                                <option value="대구광역시">대구</option>
                                <option value="광주광역시">광주</option>
                                <option value="대전광역시">대전</option>
                                <option value="울산광역시">울산</option>
                                <option value="세종특별자치시">세종</option>
                                <option value="경기도">경기</option>
                                <option value="강원도">강원</option>
                                <option value="충청북도">충북</option>
                                <option value="충청남도">충남</option>
                                <option value="경상북도">경북</option>
                                <option value="경상남도">경남</option>
                                <option value="전라북도">전북</option>
                                <option value="전라남도">전남</option>
                                <option value="제주특별자치도">제주</option>
                            </select>
                        </div>
                    </div>
                    <div id="chartBox" style = "width:700px; height:400px;">
                        <canvas id="myChart"></canvas><!-- 차트를 그릴 공간 -->
                    </div>
                </div>
                <div id= "vaccineAreaDataBox">
                    <table>
                        <colgroup>
                            <col style="width:200px">
                            <col style="width:200px">
                            <col style="width:200px">
                        </colgroup>
                        <tbody id="areaDataBox">
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
    </div>
<%@ include file="../include/footer.jsp" %>
</body>
