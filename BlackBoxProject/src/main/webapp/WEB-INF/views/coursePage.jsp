<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<style>
.jumbotron {
	padding: 30px 15px;
	margin-bottom: 30px;
	color: inherit;
	background-color: #eee;
	background-image:
		url("http://img.daoki.com/club/playground/data/__149380724169420.jpg");
}

.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}

.list-title {
	float: left;
	width: 65%;
}

.list-icon {
	float: left;
	width: 20%;
	vertical-align: middle;
}

.list-icon ul {
	float: left;
	list-style: none;
	vertical-align: middle;
}

.list-icon ul li {
	float: left;
	width: 45px;
}

#createPostBtn{
	float: right;
}
</style>

<body>
	<div class="jumbotron">
		<div class="container">
			${login.userId}
			<h1>${course.courseName }</h1>
			<p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
			<p>
				<a class="btn btn-primary btn-lg" href="#" role="button">Learn more »</a>
			</p>
		</div>
	</div>


	<div class="row">
		<div class="col-md-8">
			<a class="btn btn-default" id="createPostBtn" data-toggle="modal" data-target="#createModal">글작성</a>
			<ul class="nav nav-tabs" id="boardTab">
				<li role="presentation" data-bid=0><a href="#">Home</a></li>
				<li role="presentation" data-bid=1><a href="#">공지사항</a></li>
				<li role="presentation" data-bid=3><a href="#">자유게시판</a></li>
			</ul>
			<div id="postDiv">
				<ul class="list-group">

				</ul>
			</div>
		</div>
		<div class="col-md-4">
			<div class="list-group">
				<a href="#" class="list-group-item disabled"> Cras justo odio </a> <a href="#" class="list-group-item">Dapibus ac facilisis in</a> <a href="#" class="list-group-item">Morbi leo risus</a> <a href="#" class="list-group-item">Porta ac consectetur ac</a> <a href="#" class="list-group-item">Vestibulum at eros</a>
			</div>
		</div>
	</div>



	<div class="col-md-4"></div>




	<!-- Modal -->
	<div id="createModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<form id='registerPost' role="from" method="post">
						<div class="form-group">
							<label for="postTitle">제목</label>
							<input type="text" id="postTitle" class="form-control">
						</div>
						<div class="form-group">
							<label for="userNick">닉네임</label>
							<input type="text" id="userNick" class="form-control" disabled="disabled">
						</div>
						<div class="form-group">
							<label for="postContent">내용</label>
							<textarea class="form-control" name="content" rows="3" placeholder="Enter ..."></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">File DROP Here</label>
							<div class="fileDrop"></div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="postAddBtn">Modify</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


${course.toString()}





	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

	<script id="templatePost" type="text/x-handlebars-template">

{{#each .}}
		<a href="/posts/{{postId}}" class="list-group-item clearfix" id="postList">
			<div class="list-title">
				<h4 class="list-group-item-heading">{{postTitle}}</h4>
			</div>
			<div class='list-icon'>
				<ul>
					<li class=""><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> {{postView}}</li>
				</ul>
			</div>
			<div class='list-profile'>
				<span> {{userNick}} {{{prettifyDate postRegdate}}} </span>
			</div>
		</a>
{{/each}}

</script>
<script>
Handlebars.registerHelper("prettifyDate", function(timeValue) {
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	var date = dateObj.getDate();
	return year + "/" + month + "/" + date;
});

</script>
	<script>
	
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});

		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();

			var files = event.originalEvent.dataTransfer.files;

			var file = files[0];

			var formData = new FormData();

			formData.append("file", file);

			$.ajax({
				url : '/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {

					var fileInfo = getFileInfo(data);

					var html = template(fileInfo);

					$(".uploadedList").append(html);
				}
			});
		});
	</script>

	<script>
	
		var boardId;
		
		$("#boardTab").on("click", "li", function() {
			boardId = $(this).attr("data-bid");
			alert(boardId);
			getPage("/courses/" + ${course.courseId} +"/board/" + boardId + "/posts");
		});

		var printData = function(postArr, target, templateObject) {
			var template = Handlebars.compile(templateObject.html());

			var html = template(postArr);
			alert(html);
			$("#postList").remove();
			target.html(html);

		}

		function getPage(pageInfo) {
			
 			$.getJSON(pageInfo, function(data) {
				printData(data, $("#postDiv .list-group"), $('#templatePost'));

/* 				$("#modifyModal").modal('hide');
				$("#replycntSmall")
						.html("[" + data.pagemarker.totalCount + "]"); */
			}); 
		}
	</script>

	<script>
		
	</script>
</body>
</html>
