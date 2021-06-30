<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="css/vaccinationTargetTiming.css">
<title>Insert title here</title>
</head>
<body>
	<div id="vaccinationTargetTimingBox">
		<div class="formBox">
			<div class="menuBox">
				<p class="mainMenu">COVID19 정보</p>
				<p class="subMenu">
					<span class="material-icons">alarm</span>&nbsp백신접종 대상 및 시기
				</p>
			</div>
			<div class="contents">
				<table>
					<!-- <caption><span class="hdn">접종 순서 진행표 - 그룹(가, 나, 다, 라), 목표, 대상군</span></caption> -->
					<colgroup>
						<col style="width: 150px;">
						<col style="width: 550px;">
						<col style="width: 600px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">그룹</th>
							<th scope="col">목표</th>
							<th scope="col">대상군</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">가</th>
							<td>중증 및 사망 예방</td>

							<td>
								<div class="box">
									<p>① 노인 집단시설 입소자, 종사자</p>
									<br>
									<p>② 노인 재가복지시설 이용자, 입소자</p>
									<br>
									<p>③ 만 65세 이상</p>
									<br>
									<p>④ 성인 만성질환자</p>
									<br>
									<p>⑤ 만 50∼64세</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">나</th>
							<td>의료·방역, 사회 필수 기능 유지</td>
							<td>
								<div class="box">
									<p>① 코로나19 환자를 치료하는 의료기관 종사자</p>
									<br>
									<p>② 고위험 의료기관 종사자(보건의료인)</p>
									<br>
									<p>③ 1차 대응요원</p>
									<br>
									<p>④ 의료기관 및 약국 종사자(보건의료인)</p>
									<br>
									<p>⑤ 군인, 경찰, 소방공무원, 사회 기반시설 종사자</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">다</th>
							<td>지역사회 전파 <br>
							<br>(집단 감염) 차단
							</td>
							<td>
								<div class="box">
									<p>① 집단시설 생활자(노인 이외) 및 종사자</p>
									<br>
									<p>② 소아, 청소년 교육, 보육시설 종사자</p>
									<br>
									<p>③ 만 18∼49세</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">라</th>
							<td>접종 제외<br>
							<br>* 임상 결과에 따라 추가 가능
							</td>
							<td>
								<div class="box">
									<p>① 소아·청소년</p>
									<br>
									<p>② 임신부</p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>