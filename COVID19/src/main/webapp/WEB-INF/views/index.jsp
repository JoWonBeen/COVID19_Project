<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="include/header.jsp" %>
<body>
	<div id = "vaccineMainHomeBox">
		<div id = "mainVisualBox">
			<div class = "mask">
	            <ul class = "swiper-wrapper">
	                <li class = "swiper-slide">
						<div class = "mainVisual01">
							<div class = "sloganBox">
								<p>We provide</p>
								<p>Best Vaccine Reservation Service.</p>
							</div>
						</div>
	                </li>
	                <li class = "swiper-slide">
	                	<div class = "mainVisual02">
		                	<div class = "sloganBox">
		                		<p>We hope</p>
		                		<p>You get the COVID19 VACCINE soon.</p>
		                	</div>
	                	</div>
	                </li>
	                <li class = "swiper-slide">
	                	<div class = "mainVisual03">
		                	<div class = "sloganBox">
		                		<p>Book the COVID19 VACCINE efficiently</p>
		                		<p>Using our system!</p>
		                	</div>
	                	</div>
	                </li>
	            </ul>
	        </div>
	        
			<div id = "coronaTotalDataBox">
				<p>확진자 수 :  </p>
			</div>
			<div id = "mainVisualPaginationBtnBox">
				<div class = "pagination">
				</div>
			</div>
		</div>
		
		<div id = "vaccineStatusSection">
			<h2 class = "mainTitle">백신 예약 접종 현황</h2>
			<div class = "contentsBox">
				<div class = "vaccineReservationDataBox">
					<div>
	                    <table>
	                        <colgroup>
	                           <col style="width:150px">
	                           <col style="width:250px">
	                           <col style="width:250px">
	                        </colgroup>
	                        <tbody>
	                           <tr class = "vaccineReservationNameBox">
	                              <th>회차</th>
	                              <th>오늘 접종자</th>
	                              <th>총 접종자</th>
	                           </tr>
	                           <tr class = "vaccineReservationFirst">
	                           </tr>
	                           <tr class = "vaccineReservationSecond">
	                           </tr>
	                        </tbody>
	                     </table>
	            	</div>
				</div>
			</div>
			<div class = "moreBtn"><a href = "VaccineStatus.do">자세히보기</a></div>
		</div>
		
		<div id = "coronaSymptomMainHome">
			<h2 class = "mainTitle">COVID19 증상</h2>
			<div class = "contentsBox">
				<div class = "coronaSymptomMainDataBox">
                    <div><img src="images/symptoms01.png" alt=""><p>발열</p></div> 
				  	<div><img src="images/symptoms02.png" alt=""><p>마른기침</p></div> 
				  	<div><img src="images/symptoms03.png" alt=""><p>피로감</p></div>
				</div>
			</div>
			<div class = "moreBtn"><a href = "CoronaSymptoms.do">자세히보기</a></div>
		</div>
		
		<div id = "coronaVaccineInfoMainHome">
			<h2 class = "mainTitle">국내 COVID19 백신 종류</h2>
			<div class = "contentsBox">
				<div class = "coronaVaccineInfoMainDataBox">
                    <div><img src="images/logo-pfizer.png" alt=""><p>화이자</p></div> 
				  	<div><img src="images/logo-janssen.png" alt=""><p>얀센</p></div> 
				  	<div><img src="images/logo-moderna.png" alt=""><p>모더나</p></div>
				  	<div><img src="images/logo-AstraZeneca.png" alt=""><p>아스트라제네카</p></div>
				</div>
			</div>
			<div class = "moreBtn"><a href = "CoronaVaccineTypes.do">자세히보기</a></div>
		</div>
		
		<div id = "goReservation">
			<h2 class = "mainTitle">Book a COVID19 Vaccine right now!</h2>
			<div class = "moreBtn"><div onclick="goLogin(${loggedMemberInfo}); return false;"><a href = "ReserveForm.do">예약 바로가기</a></div></div>
		</div>
		
	</div>
<%@ include file="include/footer.jsp" %>
</body>
