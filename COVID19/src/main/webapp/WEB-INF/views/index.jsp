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
							<p>I hope you get the COVID19 VACCINE soon.</p>
						</div>
	                </li>
	                <li class = "swiper-slide">
	                	<div class = "mainVisual02">
	                		<p>I hope the COVID19 disappears as soon as possible.</p>
	                	</div>
	                </li>
	                <li class = "swiper-slide">
	                	<div class = "mainVisual03">
	                		<p>Book the COVID19 VACCINE efficiently using our system!</p>
	                	</div>
	                </li>
	            </ul>
	        </div>
	        
			<div id = "coronaTotalDataBox">
				<p>확진자 수 :  </p>
			</div>
			<div id = "mainVisualPaginationBtnBox">
<!-- 				<button class="prev"><img src="images/paginationUpBtn.png"></button> -->
				<div class = "pagination">
				</div>
<!-- 				<button class="next"><img src="images/paginationDownBtn.png"></button> -->
			</div>
		</div>
		
		<div id = "vaccineStatusSection">
			<h2 class = "mainTitle">백신 예약 접종 현황</h2>
			<div class = "contentsBox">
				<p>데이터를 입력하세요.</p>
			</div>
		</div>
		
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>
