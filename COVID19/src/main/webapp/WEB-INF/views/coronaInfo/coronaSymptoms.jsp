<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="css/coronaSymptoms.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div id = "coronaSymptomsBox">
		<div class="container">
			<div class="formBox">
				<div class = "menuBox">
					<p class="mainMenu">COVID19 정보</p>
					<p class="subMenu"><span class="material-icons">coronavirus</span>&nbsp코로나19 증상</p>
				</div>
				<div class="contents">
					<table>
						<colgroup>
							<col style="width: 200px">
							<col style="width: 1100px">
						</colgroup>
						<tbody>
							<tr>
								<th><p>코로나19 증상<p></th>
								<td>
									<h3><span class="material-icons">done</span>코로나19 감염 시의 증상은 사람마다 다릅니다. 
									<br> <span class="material-icons">done</span>대부분의 감염자가 경증에서 중증 수준의 증상을 보이며
										입원 없이 회복합니다.</h3>
									<br>
									<br>
									<h3><span class="material-icons">error</span>공통적인 증상은 다음과 같습니다.</h3>
									<br>
									<div class = "symptomsIconBox">
										<div class="iconBox"><img src="images/symptoms01.png" alt=""><div class="icon">발열</div></div> 
										<div class="iconBox"><img src="images/symptoms02.png" alt=""><div class="icon">마른기침</div></div> 
										<div class="iconBox"><img src="images/symptoms03.png" alt=""><div class="icon">피로감</div></div>
									</div> 
								</td>
							</tr>
							<tr>
								<th>그 밖의 증상</th>
								<td>
									<h3><span class="material-icons">error</span>드물지만 다음과 같은 증상이 나타날 수도 있습니다.</h3>
									<br>
									<br>
									<p>- 몸살</p>
									<br>
									<p>- 가래</p>
									<br>
									<p>- 인후통</p>
									<br>
									<p>- 설사</p>
									<br>
									<p>- 결막염</p>
									<br>
									<p>- 두통</p>
									<br>
									<p>- 객혈과 오심</p>
									<br>
									<p>- 미각 또는 후각 상실</p>
									<br>
									<p>- 피부 발진, 손가락 또는 발가락 변색</p>
								</td>
							</tr>
							<tr>
								<th>중증 증상</th>
								<td>
									<h3><span class="material-icons">error</span>심각한 증상은 다음과 같습니다.</h3>
									<br>
									<br>
									<p>- 호흡 곤란 또는 숨 가쁨</p>
									<br>
									<p>- 가슴 통증 또는 압박감</p>
									<br>
									<p>- 언어 또는 운동 장애</p>
									<br>
									<p><span class="material-icons">done</span>심각한 증상이 있다면 즉시 의료진의 도움을 받으세요. 
									<br>
									<span class="material-icons">done</span>의사를 보러 가거나 의료기관을 방문하기 전에 항상 미리 연락을 취하세요.</p>
									<p><span class="material-icons">done</span>다른 건강상 불편이 없는 경증 환자는 자택에서 증상을 관리해야 합니다.</p>
									<P><span class="material-icons">done</span>바이러스 감염 후 증상이 나타날 때까지 평균 5~-6일이 걸리지만 최대 14일이 소요될 수도 있습니다.</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>