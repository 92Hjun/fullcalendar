<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Company Full Calendar</title>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.1/fullcalendar.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://momentjs.com/downloads/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/locale/ko.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.1/fullcalendar.min.js"></script>	 
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.1/locale/ko.js"></script>
<script type="text/javascript">
	$(function(){
		function timeToString(time) {
			return moment(new Date(time)).format("YYYY-MM-DD HH:mm");
		}
		function createEventData() {
			var eventData = {};
			eventData["title"] = $("#event-title").val();
			eventData["description"] = $("#event-description").val();
			eventData["startDate"] = $('#event-start-date').val();
			eventData["startHour"] = $('#event-start-hour').val();
			eventData["startMinute"] = $('#event-start-minute').val();
			if (!$("#event-all-day").prop("checked")) {
				eventData["endDate"] = $('#event-end-date').val();
				eventData["endHour"] = $('#event-end-hour').val();
				eventData["endMinute"] = $('#event-end-minute').val();
			}
			eventData["allDay"] = $("#event-all-day").prop("checked");
			
			return eventData;
		}
		function initializeForm(date) {
			var yyyymmdd = date.format();
			var now = new Date();
			var hour = now.getHours();
			
			$("#event-form-modal #event-title").val("");
			$("#event-form-modal #event-description").val("");
			$("#event-form-modal #event-start-date").val(yyyymmdd);
			$("#event-form-modal #event-end-date").val(yyyymmdd);
			$("#event-form-modal #event-start-hour").val(hour);
			$("#event-form-modal #event-start-minute").val("00");
			$("#event-form-modal #event-end-hour").val(parseInt(hour)+1);
			$("#event-form-modal #event-end-minute").val("00");		
		}
		
		// 등록버튼
		$("#add-event-btn").click(function() {
			$.ajax({
				type:'post',
				url:'addEvent',
				dataType: 'json',
				data: createEventData(),
				success: function(data){
					console.log(data);
				}
			});
		});
		
		
		$('#calendar-box').fullCalendar({
			events: function(start, end, timezone, callback){
				
			},
			dayClick: function(date, jsEvent, view) {
				// 일정정보를 입력하는 모달창의 입력값을 초기화한다.
				initializeForm(date);
				// 모달창을 표시한다.
				$("#event-form-modal").modal("show");
			},
			// [eventClick : 캘린더에 표시된 일정 중 하나를 클릭했을 때 실행되는 콜백함수다.]
			eventClick: function(event, jsEvent, view) {
				console.log(event);
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
		    	<div class="navbar-header">
		      		<a class="navbar-brand" href="home">홈</a>
		    	</div>
		    	<ul class="nav navbar-nav pull-right">
		      		<li><a href="login.do">로그인</a></li>
		      		<li><a href="logout.do">로그아웃</a></li>
		    	</ul>
			</div>
		</nav>
	  	<div class="jumbotron">
	  		<h1>일정 관리 프로그램</h1> 
	  		<p>본인의 일정 관리 및 다른 사람의 일정을 조회하는 프로그램입니다.</p> 
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div id="calendar-box"></div>
			</div>
		</div>
		<div class="modal fade" id="event-form-modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	  		<div class="modal-dialog" role="document">
	    		<div class="modal-content">
	      			<div class="modal-header">
	        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        			<h4 class="modal-title" id="gridSystemModalLabel">새 일정 등록폼</h4>
	      			</div>
	      			<div class="modal-body">
	      				<form class="form-horizontal well">
	  						<div class="form-group">
	    						<label for="title" class="col-sm-2 control-label">제목</label>
	    						<div class="col-sm-10">
	      							<input type="text" class="form-control" id="event-title" name="title" placeholder="제목을 입력하세요">
	    						</div>
	  						</div>
	  						<div class="form-group">
	    						<label for="description" class="col-sm-2 control-label">내용</label>
	    						<div class="col-sm-10">
	      							<textarea rows="3" class="form-control" id="event-description" name="description" placeholder="내용을 입력하세요" ></textarea>
	    						</div>
	  						</div>
	  						<div class="form-group">
	    						<label for="start-date" class="col-sm-2 control-label">시작 일시</label>
	    						<div class="col-sm-4">
	      							<input type="date" class="form-control" id="event-start-date" name="startDate" >
	    						</div>
	    						<div class="col-sm-2">
	      							<input type="number" class="form-control" id="event-start-hour" name="startHour"  min="0" max="23" step="1">
	    						</div>
	    						<label for="start-hour" class="col-sm-1 control-label">시</label>
	    						<div class="col-sm-2">
	      							<input type="number" class="form-control" id="event-start-minute" name="startMinute"  min="00" max="50" step="10">
	    						</div>
	    						<label for="start-minute" class="col-sm-1 control-label">분</label>
	  						</div>
	  						<div class="form-group">
	    						<label for="end-date" class="col-sm-2 control-label">종료 일시</label>
	    						<div class="col-sm-4">
	      							<input type="date" class="form-control" id="event-end-date" name="endDate" >
	    						</div>
	    						<div class="col-sm-2">
	      							<input type="number" class="form-control" id="event-end-hour" name="endHour" min="0" max="23" step="1">
	    						</div>
	    						<label for="end-hour" class="col-sm-1 control-label">시</label>
	    						<div class="col-sm-2">
	      							<input type="number" class="form-control" id="event-end-minute" name="endMinute" min="00" max="50" step="10" >
	    						</div>
	    						<label for="end-minute" class="col-sm-1 control-label">분</label>
	  						</div>
	  						<div class="form-group">
	    						<label for="title" class="col-sm-2 control-label">하루 종일</label>
	    						<div class="col-sm-1">
	    							<input type="checkbox" class="form-control" id="event-all-day" name="allDay">
	    						</div>
	  						</div>
						</form>
	      			</div>
	      			<div class="modal-footer">
	        			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        			<button type="button" class="btn btn-primary" id="add-event-btn">등록</button>
	      			</div>
	    		</div>
	  		</div>
		</div>
	</div>
</body>
</html>