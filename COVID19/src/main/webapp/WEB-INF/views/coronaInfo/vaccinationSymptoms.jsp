<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="css/coronaInfoLayout.css">
<link rel="stylesheet" href="css/swiper.css">
<script src="js/swiper-bundle.min.js"></script>
<script src="js/coronaInfo.js" defer></script>
<title>Insert title here</title>
</head>
<body>
    <div class = "container">
        <h1 class="mainMenu">COVID19 정보</h1>
	    <h2 class="subMenu">접종 후 증상 및 대처방안</h2>
        <div>
            <img src="images/symtoms.PNG" alt="">
        </div>
        <div class="swiper-container">
            <ul class="solution swiper-wrapper">
                <li class="swiper-slide">
                    <div class="">
                        <img src="images/sol1.PNG" alt="">
                    </div>
                    <div class="txt">
                        <h2 class="title"></h2>
                        <p></p>
                    </div>
                 </li>
                 <li class="swiper-slide">
                    <div class="">
                        <img src="images/sol2.PNG" alt="">
                    </div>
                    <div class="txt">
                        <h2 class="title"></h2>
                        <p></p>
                    </div>
                 </li>
                 <li class="swiper-slide">
                    <div class="">
                        <img src="images/sol3.PNG" alt="">
                    </div>
                    <div class="txt">
                        <h2 class="title"></h2>
                        <p></p>
                    </div>
                 </li>
            </ul>
        </div>
    </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>