<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/include.css">
<link rel="stylesheet" href="css/reset.css">
<script src="js/jquery-3.6.0.min.js"></script> 
<link href="css/common.css" rel="stylesheet">
<link href="css/coronaLive.css" rel="stylesheet">
<script src="js/corona.js" defer></script>
<script src="js/calendar.js" defer></script>

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
	<h2 style = "text-align:center; font-size:50px; margin-top:30px; color:blue;">Corona Live</h2>
</header>

</head>
<body>
	<div id="corona">
		<header id="header" class="header">
			<h1>
				<span class="title">CORONA</span>
			</h1>
		</header>
		<main id="main">
			<ul class="coronaList">
				
			</ul>
		</main>


		<div id="calendar">
			<div id="todo">
				<div class="day" id="pickedDay">THU</div>
				<div class="date" id="pickedDate">10</div>
			</div>
			<div class="calendarBox">
				<div class="header">
					<button class="btn btnPrevMonth"><span class="material-icons">chevron_left</span></button>
					<div class="monthTitle">
						<span class="year">2021</span>
						<span class="month">06</span>
					</div>
					<button class="btn btnNextMonth"><span class="material-icons">chevron_right</span></button>
				</div>
				<div class="days">
					<ul class="itemList">
						<li class="sun"><span>SUN</span></li>
						<li><span>MON</span></li>
						<li><span>TUE</span></li>
						<li><span>WED</span></li>
						<li><span>THU</span></li>
						<li><span>FRI</span></li>
						<li class="sat"><span>SAT</span></li>
					</ul>
				</div>
				<div id="dates">
					<ul class="itemList">
						<li><span>01</span></li>
						<li><span>02</span></li>
						<li><span>03</span></li>
						<li><span>04</span></li>
						<li><span>05</span></li>
						<li><span>06</span></li>
						<li><span>07</span></li>
						<li><span>08</span></li>
						<li><span>09</span></li>
						<li><span>10</span></li>
						<li><span>11</span></li>
						<li><span>12</span></li>
						<li><span>13</span></li>
						<li><span>14</span></li>
						<li><span>15</span></li>
						<li><span>16</span></li>
						<li><span>17</span></li>
						<li><span>18</span></li>
						<li><span>19</span></li>
						<li><span>20</span></li>
						<li><span>21</span></li>
						<li><span>22</span></li>
						<li><span>23</span></li>
						<li><span>24</span></li>
						<li><span>25</span></li>
						<li><span>26</span></li>
						<li><span>27</span></li>
						<li><span>28</span></li>
						<li><span>29</span></li>
						<li><span>30</span></li>
						<li><span>31</span></li>
						<li><span>31</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>





</head>
</html>