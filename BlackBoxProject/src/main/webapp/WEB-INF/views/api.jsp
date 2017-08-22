<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>SPA DEMO</title>

<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

<!-- handlebars -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
</html>
<body>

	<form class="form-horizontal" data-app="form">
		<div class="form-group">
			<label class="col-sm-2 control-label">UniversityName</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="universityName"
					placeholder="UniversityName">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="button" class="btn btn-default" id="searchAvailableBtn">Search</button>
				<button type="button" class="btn btn-warning" data-app="form-cancel">Cancel</button>
				<button type="button" class="btn btn-danger" data-app="form-remove">
					<span class="glyphicon glyphicon-trash"></span>
				</button>
			</div>
		</div>
	</form>
	<div class="panel panel-default">
		<div class="panel-heading">이용가능한 강의목록</div>
		<div id="lectureListDiv"></div>
	</div>

	<div class="panel panel-default">
		<div class="panel-heading">Result
		<button class="btn btn-default" type="submit" id="registLecturesBtn" display="none">최종등록</button>
		</div>
		<div id="lectureResultDiv"></div>
	</div>

<script id="template_lectures" type="text/x-handlebars-template">
{{#each .}}
  <ul class="list-group" id="lectureList">
	<h3 class="list-group-item-heading">{{@key}}</h4>
	{{#each this}}
    <li data-univ="{{@../key}}" data-path="{{this}}" class="list-group-item">{{this}}<button class="btn btn-default" type="submit">강의목록 등록</button>
	</li>
	{{/each}}
  </ul>
{{/each}}
</script>

<script id="template_lectures_result" type="text/x-handlebars-template">
  <ul class="list-group" id="lectureResult">
{{#each .}}
    <li class="list-group-item">{{courseCode}} / {{courseClass}} / {{courseName}} /
		{{courseTime}} / {{courseDiv}} / {{courseDepartment}} / {{coursePhone}} /
		{{courseCampus}} / {{courseGrade}} / {{courseProf}} / {{courseClassroom}} /
		{{courseCredit}} / {{courseYear}} / {{courseSemester}}
	</li>
{{/each}}
  </ul>
</script>

	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>

	<script>
		$(document).ready(function() {
		
			$("#registLecturesBtn").hide();
			
		});
		
		var resultLectures_json = null;
		var univ = null;
		$("#lectureListDiv").on("click", "#lectureList button", function() {
			
			$("#lectureResult").remove();
			$("#registLecturesBtn").hide();
			var li = $(this).parent();
			var filepath = li.attr("data-path");
			univ = li.attr("data-univ");
			alert(filepath + " : " + univ );
			  $.ajax({
					type:'put',
					url:'/api/' + univ +"/lectures",
					headers: { 
					      "Content-Type": "application/json",
					      "X-HTTP-Method-Override": "put" },
					dataType:'text',
					data: JSON.stringify({filename : filepath}),
					success:function(result){
						resultLectures_json = result;
						alert(result);
						$("#registLecturesBtn").show();
						var json_data = JSON.parse(result);
						printLectureList(json_data, $("#lectureResultDiv"),
									$("#template_lectures_result"));
					}
				});
		});
		
		$("#registLecturesBtn").on("click", function() {
			json = JSON.stringify(resultLectures_json);
			alert(json);
			  $.ajax({
					type:'post',
					url:'/api/' + univ +"/lectures",
					headers: { 
					      "Content-Type": "application/json",
					      "X-HTTP-Method-Override": "POST" },
					dataType:'text',
					data: resultLectures_json,
					success:function(result){
						alert("등록완료");
					}
				});			
		});
		
		$("#searchAvailableBtn").on("click", function() {
			
			$("#lectureResult").remove();
			$("#registLecturesBtn").hide();
			
			var univNameObj = $("#universityName");
			var univName = univNameObj.val();

			var url = "/api/" + univName + "/lectures";
			$("#lectureList").remove();
			getLectureList(url, univName);

		});
		

		var printLectureList = function(replyArr, target, templateObject) {

			var template = Handlebars.compile(templateObject.html());

			var html = template(replyArr);

			target.html(html);

		}

		function getLectureList(pageInfo, univName) {

			$.getJSON(pageInfo, function(data) {
				var json_data = JSON.parse(data);
				printLectureList(json_data, $("#lectureListDiv"),
						$("#template_lectures"));

			});
		}
		
		

	</script>

</body>
</html>