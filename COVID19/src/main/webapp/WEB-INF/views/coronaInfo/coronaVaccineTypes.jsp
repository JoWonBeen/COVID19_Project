<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="css/coronaInfoLayout.css">
<title>Insert title here</title>
</head>
<body>
    <div class = "container">
        <h1 class="mainMenu">COVID19 정보</h1>
	    <h2 class="subMenu">코로나19 백신 정보</h2>
        <div class="contents">
            <table border="1">
                <colgroup>
                    <col style="width:200px">
                    <col style="width:200px">
                    <col style="width:200px">
                    <col style="width:200px">
                    <col style="width:200px">
                </colgroup>
                <thead>
                    <tr>
                        <th>구분</th>
                        <th>화이자</th>
                        <th>모더나</th>
                        <th>아스트라제네카</th>
                        <th>얀센</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>백신종류</th>
                        <td>mRNA백신</td>
                        <td>mRNA백신</td>
                        <td>바이러스전달체백신</td>
                        <td>바이러스전달체백신</td>
                    </tr>
                    <tr>
                        <th>개발국</th>
                        <td>미국/독일</td>
                        <td>미국</td>
                        <td>영국</td>
                        <td>미국</td>
                    </tr>
                    <tr>
                        <th>연령</th>
                        <td>만 16세 이상</td>
                        <td>만 18세 이상</td>
                        <td>만 18세 이상</td>
                        <td>만 18세 이상</td>
                    </tr>
                    <tr>
                        <th>접종회수/간격</th>
                        <td>2회/3주(21일)</td>
                        <td>2회/4주(28일)</td>
                        <td>2회/8~12주</td>
                        <td>1회</td>
                    </tr>
                    <tr>
                        <th>수량</th>
                        <td>6,600만회분</td>
                        <td>4000만회분</td>
                        <td>2000만회분</td>
                        <td>600만회분</td>
                    </tr>
                    <tr>
                        <th>보관</th>
                        <td>-90℃ ~ -60℃(6개월) </td>
                        <td>-20℃(6개월)</td>
                        <td>2~8℃(6개월)</td>
                        <td>-25℃ ~ -15℃(24개월)</td>
                    </tr>
                    <tr>
                        <th>유통</th>
                        <td>2℃~8℃ (5일)</td>
                        <td>2℃~8℃ (30일)</td>
                        <td>2℃~8℃ (6개월)</td>
                        <td>2℃~8℃ (3개월)</td>    
                    </tr>
                    <tr>
                        <th>개봉 후 저장</th>
                        <td>희석 후 실온 (2℃~30℃) 6시간</td>
                        <td>실온 6시간</td>
                        <td>실온(30℃ 이하) 6시간</td>
                        <td>2℃~8℃ 6시간, 실온(25℃이하) 3시간</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>