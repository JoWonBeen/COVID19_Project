<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="css/vaccinationStatus.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<!-- <link rel="stylesheet" href="css/swiper.css"> -->
<!-- <script src="js/swiper-bundle.min.js"></script> -->
<!-- <script src="js/coronaInfo.js" defer></script> -->
<title>Insert title here</title>
</head>
<body>
	<div id="vaccinationSymptomBox">
		<div class="formBox">
			<div class="menuBox">
				<p class="mainMenu">COVID19 정보</p>
				<p class="subMenu">
					<span class="material-icons">local_hospital</span>&nbsp 접종 후 증상 및
					대처방안
				</p>
			</div>
			<div class="contents">
				<div class="basicSymptoms">
					<div class="titleBox">
					<p>예방접종 후 흔하게 발생하는 증상</p>
					<p>예방접종 후에 아래와 같은 증상이 흔하게 발생할 수 있으며 대부분 2~3일 내 저절로 좋아집니다.</p>
					</div>
					<div class="vaBox">
						<div class="va">
							<img src="images/vaccineafter01.png" alt="">
							<p>접종부위 통증, 부기, 발적</p>
						</div>
						<div class="va">
							<img src="images/vaccineafter02.png" alt="">
							<p>발열, 메스꺼움, 근육통</p>
						</div>
						<div class="va">
							<img src="images/vaccineafter03.png" alt="">
							<p>피로감</p>
						</div>
						<div class="va">
							<img src="images/vaccineafter04.png" alt="">
							<p>두통</p>
						</div>
					</div>
				</div>
				<div class="swiper-container">
					<ul class="solution swiper-wrapper">
						<li class="swiper-slide">
							<div class="lineBox">
								<div class="imgBox">
									<img src="images/vaccineafter05.png" alt="">
									<div class="txt">
										<h2 class="title">이럴 땐, 이렇게 하세요</h2>
										<p>
											<span class="material-icons">check</span>&nbsp 접종 후 접종부위
											부기/통증이 있는 경우, 깨끗한 마른수건을 대고 그 위에 <br>냉찜질을 하세요
										</p>
										<p>
											<span class="material-icons">check</span>&nbsp 접종 후 미열이 있는
											경우, 수분을 충분히 섭취하고 휴식을 취하세요
										</p>
										<p>
											<span class="material-icons">check</span>&nbsp 접종 후 발열, 근육통
											등으로 불편할 경우, 해열/진통제를 복용하시면 <br>도움이 됩니다.
										</p>
										<p>
											<span class="material-icons">check</span>&nbsp 예방접종 전에 미리
											아세트아미노펜 성분의 해열/진통제를 준비하고, 접종 후 <br>몸살 증상이 있으면 복용하세요
										</p>
									</div>
								</div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="lineBox">
								<div class="imgBox">
									<img src="images/vaccineafter06.png" alt="">
									<div class="txt">
										<h2 class="title">이럴 땐, 의사 진료를 받으세요</h2>
										<p>
											<span class="material-icons">check</span>&nbsp 접종 후 4주 내
											호흡곤란, 흉통, 지속적인 복부통증, 팔/다리부기와 같은 증상이 <br>나타난 경우
										</p>
										<p>
											<span class="material-icons">check</span>&nbsp 접종 후 심한 또는 2일
											이상의 지속적인 두통이 발생하며, 진통제에 반응하지 <br>않거나 조절되지 않는 경우 또는 시야가
											흐려지는 경우
										</p>
										<p>
											<span class="material-icons">check</span>&nbsp 접종 후 접종부위가 아닌
											곳에서 멍이나 출혈이 생긴 경우 등
										</p>
										<p>
											<span class="material-icons">check</span>&nbsp 접종 후 접종 부위 부기,
											통증, 발적이 48시간이 지나도 호전되지 않은 경우
										</p>
										<p>
											<span class="material-icons">check</span>&nbsp 접종 후 갑자기 기운이
											떨어지거나 평소와 다른 이상 증상이 나타난 경우
										</p>
									</div>
								</div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="lineBox">
								<div class="imgBox">
									<img src="images/vaccineafter07.png" alt="">
									<div class="txt">
										<h2 class="title">
											이럴땐, 119에 신고 또는 <br>응급실을 방문하세요
										</h2>
										<p>
											<span class="material-icons">check</span>&nbsp 접종 후 숨쉬기 곤란하거나
											심하게 어지러운 경우
										</p>
										<p>
											<span class="material-icons">check</span>&nbsp 접종 후 입술, 얼굴이
											붓거나 온몸에 심한 두드러기 증상이 나타나는 경우
										</p>
										<p>
											<span class="material-icons">check</span>&nbsp 접종 후 갑자기 의식이
											없거나 쓰러진 경우
										</p>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>