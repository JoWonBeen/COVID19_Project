<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/include.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/memberInfoForm.css">
<script src="js/jquery-3.6.0.min.js"></script> 
<script src="js/memberLogin.js" defer></script>
<header id="header">
    <c:choose>
		<c:when test="${loggedMemberInfo.type == 1 || loggedMemberInfo == null}">
			<h1 id="logo">
		        <a href="Index.do"><img src="images/logoMember.png" alt=""> </a>
		    </h1>
		</c:when>
		<c:otherwise>
			<h1 id="logo">
		        <a href="Index.do"><img src="images/logoAdmin.png" alt=""> </a>
		    </h1>
		</c:otherwise>
	</c:choose>
	<nav id="gnb">
		<ul class="gnbList" onclick="goLogin(${loggedMemberInfo}); return false;">
			<li ><a href="Index.do" class="depth01">COVID19 정보</a>
				<ul class="depth02">
					<li><a href="">코로나 증상</a></li>
					<li><a href="">코로나 백신</a></li>
					<li><a href="">접종대상&시기</a></li>
					<li><a href="">백신 접종현황</a></li>
					<li><a href="">백신 부작용&처치방안</a></li>
				</ul>
			</li>
			<li><a href="" class="depth01">의료기관</a>
				<ul class="depth02">
					<li><a href="">의료기관 검색</a></li>
					<li><a href="">백신 수량</a></li>
				</ul>
			</li>
			
			<c:choose>
				<c:when test="${loggedMemberInfo.type == 1 || loggedMemberInfo == null}">
					<li><a href="" class="depth01">백신접종 예약</a>
						<ul class="depth02">
							<li><a href="">대상자 조회</a></li>
							<li><a href="">백신 예약</a></li>
						</ul>
					</li>
					<li><a href="" class="depth01">백신접종 예약현황</a>
						<ul class="depth02">
							<li><a href="">백신 예약조회</a></li>
							<li><a href="">백신 예약수정</a></li>
							<li><a href="">백신 예약취소</a></li>
						</ul>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="" class="depth01">백신 등록</a>
					</li>
					<li>
						<a href="" class="depth01">센터 예방접종 예약현황</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			
			<li><a href="" class="depth01">문의하기</a>
				<ul class="depth02">
					<li><a href="">자주묻는 질문</a></li>
					<li><a href="">Q&A</a></li>
					<li><a href="">1:1 게시판</a></li>
				</ul>
			</li>
		</ul>
	</nav>



	<div class = "loginBox">
		<c:choose>
			<c:when test="${loggedMemberInfo != null }">
				<ul>
					<li>${loggedMemberInfo.name}님</li>
					<li><a href="MemberInfo.do">회원정보수정</a></li>
					<li><a href="MemberLogout.do">로그아웃</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li><a href="LoginForm.do">로그인</a></li>
					<li><a href="SignUp.do">회원가입</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>

</header>
</head>
</html>