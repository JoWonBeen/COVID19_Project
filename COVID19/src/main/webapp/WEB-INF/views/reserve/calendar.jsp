<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- <link rel="stylesheet" href="css/calendar.css"> -->
<!-- <link rel="stylesheet" href="css/reset.css"> -->
<!-- <link rel="stylesheet" href="css/common.css"> -->
<!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" -->
<!--       rel="stylesheet"> -->
<!-- <script src="js/jquery-3.6.0.min.js"></script> -->
<!-- <script src="js/calendar.js" defer></script>  -->
<!-- </head> -->
<!-- <body> -->
<!-- <div id="calendar"> -->
<!-- 			<div class="calendarBox"> -->
<!-- 				<div class="header"> -->
<!-- 					<button class="btn btnPrevMonth"><span class="material-icons">chevron_left</span></button> -->
<!-- 					<div class="monthTitle"> -->
<!-- 						<span class="year">2021</span> -->
<!-- 						<span class="month">06</span> -->
<!-- 					</div> -->
<!-- 					<button class="btn btnNextMonth"><span class="material-icons">chevron_right</span></button> -->
<!-- 				</div> -->
<!-- 				<div class="days"> -->
<!-- 					<ul class="itemList"> -->
<!-- 						<li class="sun"><span>SUN</span></li> -->
<!-- 						<li><span>MON</span></li> -->
<!-- 						<li><span>TUE</span></li> -->
<!-- 						<li><span>WED</span></li> -->
<!-- 						<li><span>THU</span></li> -->
<!-- 						<li><span>FRI</span></li> -->
<!-- 						<li class="sat"><span>SAT</span></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 				<div id="dates"> -->
<!-- 					<ul class="itemList"> -->
<!-- 						<li><span>01</span></li> -->
<!-- 						<li><span>02</span></li> -->
<!-- 						<li><span>03</span></li> -->
<!-- 						<li><span>04</span></li> -->
<!-- 						<li><span>05</span></li> -->
<!-- 						<li><span>06</span></li> -->
<!-- 						<li><span>07</span></li> -->
<!-- 						<li><span>08</span></li> -->
<!-- 						<li><span>09</span></li> -->
<!-- 						<li><span>10</span></li> -->
<!-- 						<li><span>11</span></li> -->
<!-- 						<li><span>12</span></li> -->
<!-- 						<li><span>13</span></li> -->
<!-- 						<li><span>14</span></li> -->
<!-- 						<li><span>15</span></li> -->
<!-- 						<li><span>16</span></li> -->
<!-- 						<li><span>17</span></li> -->
<!-- 						<li><span>18</span></li> -->
<!-- 						<li><span>19</span></li> -->
<!-- 						<li><span>20</span></li> -->
<!-- 						<li><span>21</span></li> -->
<!-- 						<li><span>22</span></li> -->
<!-- 						<li><span>23</span></li> -->
<!-- 						<li><span>24</span></li> -->
<!-- 						<li><span>25</span></li> -->
<!-- 						<li><span>26</span></li> -->
<!-- 						<li><span>27</span></li> -->
<!-- 						<li><span>28</span></li> -->
<!-- 						<li><span>29</span></li> -->
<!-- 						<li><span>30</span></li> -->
<!-- 						<li><span>31</span></li> -->
<!-- 						<li><span>31</span></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- </body> -->
<!-- </html> -->

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
</head>
<body>
<form action="ReserveForm.do" method="Get">
	<p>
		Date: <input type="text" id="datepicker">
	</p>
	<div class="btns">
		<input type="hidden" name="no" value="${reserveBean.no}">
		<input  type="submit" value="Check" id="check"> 
		<input type="reset" value="Cancel" id="cancel">
	</div>
</form>

</body>
</html>