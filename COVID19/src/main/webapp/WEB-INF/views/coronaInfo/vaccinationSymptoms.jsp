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
    <div id="vaccinationSymptomBox">
        <div class = "formBox">
            <div class="menuBox">
                <h1 class="mainMenu">COVID19 정보</h1>
                <h2 class="subMenu">접종 후 증상 및 대처방안</h2>
            </div>
            <div class="content">
                <div class="basicSymptoms">
                    <p>예방접종 후 흔하게 발생하는 증상</p>
                    <p>예방접종 후에 아래와 같은 증상이 흔하게 발생할 수 있으며 대부분 2~3일 내 저절로 좋아집니다. </p>
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
        </div>
    </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>