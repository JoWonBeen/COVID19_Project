<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>COVID19 Reservation</title>
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/include.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/memberInfoForm.css">
<link rel="stylesheet" href="css/vaccineMainHome.css">
<link rel="stylesheet" href="css/swiper-bundle.min.css">
<link rel="stylesheet" href="css/reservation.css">
<link rel="stylesheet" href="css/vaccinationSymptom.css">
<link rel="stylesheet" href="css/vaccinationStatus.css">
<link rel="stylesheet" href="css/vaccineReservaion.css">
<link rel="stylesheet" href="css/coronaSymptoms.css">
<link rel="stylesheet" href="css/coronaVaccineTypes.css">
<link rel="stylesheet" href="css/vaccinationTargetTiming.css">
<link rel="stylesheet" href="css/mediCenter.css">
<link rel="stylesheet" href="css/reservation.css">
<link rel="stylesheet" href="css/vaccineReserveList.css">

<script src="js/coronaLiveGetCoronaData.js" defer></script>
<script src="js/vaccineStatusGetData.js" defer></script>
<script src="js/jquery-3.6.0.min.js"></script> 
<script src="js/chart.min.js"></script> 
<script src="js/memberLogin.js" defer></script>
<script src="js/centerAdmin.js" defer></script>
<script src="js/VaccineHome.js" defer></script>
<script src="js/include.js" defer></script>
<script src="js/gsap/gsap.min.js"></script>
<script src="js/swiper-bundle.min.js"></script>
<script src="js/replyBoard.js" defer></script>
<script src="js/mediCenterGetData.js" defer></script>
<script src="js/mediCenterSearch.js" defer></script>
<script src="js/reserve.js" defer></script>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<header id="header">
   <h1 id="logo">
        <a href="Index.do"><img src="images/logo.png" alt=""> </a>
    </h1>
   <nav id="gnb">
      <ul class="gnbList">
         <c:choose>
            <c:when test="${loggedMemberInfo.type != 3 || loggedMemberInfo == null}">
            	<li>
                	<a href="CoronaSymptoms.do" class="depth01">COVID19 ??????</a>
		        	<ul class="depth02">
		               <li><a href="CoronaSymptoms.do">????????? ??????</a></li>
		               <li><a href="CoronaVaccineTypes.do">????????? ??????</a></li>
		               <li><a href="VaccineTargetTiming.do">????????????&??????</a></li>
		               <li><a href="VaccineStatus.do">?????? ????????????</a></li>
		               <li><a href="VaccineSymptoms.do">?????? ?????????&????????????</a></li>
		            </ul>
		         </li>
		         <li><a href="MediCenterSearch.do" class="depth01">????????????</a>
		            <ul class="depth02">
		               <li><a href="MediCenterSearch.do">???????????? ??????</a></li>
		               <li><a href="MediCenterVaccSearch.do">?????? ??????</a></li>
		            </ul>
		         </li>
               <c:choose>
                  <c:when test="${loggedMemberInfo.type == 1 || loggedMemberInfo == null}">
                     <li onclick="goLogin(${loggedMemberInfo}); return false;"><a href="ReserveForm.do" class="depth01">???????????? ??????</a>
                        <ul class="depth02">
                           <li><a href="PickedWriteForm.do">????????? ??????</a></li>
                           <li><a href="ReserveForm.do">?????? ??????</a></li>
                        </ul>
                     </li>
                     <li onclick="goLogin(${loggedMemberInfo}); return false;"><a href="ReserveList.do" class="depth01">???????????? ????????????</a></li>
                     <li onclick="goLogin(${loggedMemberInfo}); return false;"><a href="BoardList.do" class="depth01">????????????</a></li>
                  </c:when>
                  <c:otherwise>
                     <li onclick="goLogin(${loggedMemberInfo}); return false;">
                        <a href="VaccineAdd.do" class="depth01">?????? ??????</a>
                     </li>
                     <li onclick="goLogin(${loggedMemberInfo}); return false;">
                        <a href="CenterReserveList.do" class="depth01">???????????? ????????????</a>
                     </li>
                  </c:otherwise>
               </c:choose>
            </c:when>
            <c:otherwise>
               <li onclick="goLogin(${loggedMemberInfo}); return false;"><a href="BoardList.do" class="depth01">????????????</a></li>
            </c:otherwise>
         </c:choose>
      </ul>
   </nav>

   <div class = "loginBox">
      <c:choose>
         <c:when test="${loggedMemberInfo != null }">
            <ul>
               <li>${loggedMemberInfo.name}???</li>
               <li><a href="MemberInfo.do">??????????????????</a></li>
               <li><a href="MemberLogout.do">????????????</a></li>
            </ul>
         </c:when>
         <c:otherwise>
            <ul>
               <li><a href="LoginForm.do">?????????</a></li>
               <li><a href="SignUp.do">????????????</a></li>
            </ul>
         </c:otherwise>
      </c:choose>
   </div>
   <div class="coronaLiveNav">   
      <a href = "CoronaConditionHome.do">Corona Live ????????????</a>
   </div>
	</header>
