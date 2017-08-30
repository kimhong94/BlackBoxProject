<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Main content -->


<!-- 
<style>

#indent1 {
	width: 80%;
	float : right;
}
#indent2 {
	width: 75%;
	float : right;
}
#indent3 {
	width: 70%;
	float : right;
}
#indent4 {
	width: 65%;
	float : right;
}
#indent5 {
	width: 60%;
	float : right;
}
#indent6 {
	width: 55%;
	float : right;
}
</style>
 -->


<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">
					<input type='hidden' name='qnaPostId' value="${qnABoardVO.qnaPostId}">
					<input type="hidden" name="page" value="${cri.page}">
					<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
				</form>

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label>
						<input type="text" name='qnaPostTitle' class="form-control" value="${qnABoardVO.qnaPostTitle}" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name=qnaPostContent rows="3" readonly="readonly">${qnABoardVO.qnaPostContent}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label>
						<input type="text" name="userNick" class="form-control" value="${qnABoardVO.userNick}" readonly="readonly">
					</div>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">
					<button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
					<button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
					<button type="submit" class="btn btn-primary" id="goListBtn">GO LIST</button>
				</div>



			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->



	<div class="row">
		<div class="col-md-12">

			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
				<div class="box-body">
					<label for="exampleInputEmail1">Writer</label>
					<input class="form-control" type="text" placeholder="USER ID" id="newReplyWriter" value="${login.userNick }" readonly="readonly">
					<label for="exampleInputEmail1">Reply Text</label>
					<input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">댓글 달기</button>
				</div>
			</div>


			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv"><span class="bg-green"> Replies List </span></li>
			</ul>


			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->



	<!-- modify Modal -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="qnaCommentContent" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- rereply Modal -->
	<div id="rereplyModal" class="modal modal-default fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>

				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="reqnaCommentContent" class="form-control">
						<input type="hidden" id="reqnaCommentGroupId">
						<input type="hidden" id="reqnaCommentStep">
						<input type="hidden" id="reqnaCommentIndent">
						<input type="hidden" id="reuserNick" class="userNick" value="${login.userNick }">
					</p>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="rereplyBtn">답글 달기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>


</section>
<!-- /.content -->

<script id="template" type="text/x-handlebars-template">
{{#each .}}


<li class="replyLi" data-rno={{qnaCommentId}}>

<i class="fa fa-comments bg-blue"></i>

 <div class="timeline-item indent" data-indent={{qnaCommentIndent}}>

  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate qnaCommentRegdate}}
  </span>

  <h3 class="timeline-header"><strong>{{qnaCommentId}}</strong> -{{userNick}}</h3>

  <div class="timeline-body">{{qnaCommentContent}}</div>


  <input type="hidden" id = "qnaCommentGroupId" value="{{qnaCommentGroupId}}">

  <input type="hidden" id = "qnaCommentStep" value="{{qnaCommentStep}}">

  <input type="hidden" id = "qnaCommentIndent" value="{{qnaCommentIndent}}">

    <div class="timeline-footer">
     <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">수정 하기</a>
	 <a class="btn btn-default btn-xs" data-toggle="modal" data-target="#rereplyModal">답글 달기</a>
    </div>
  </div>			
</li>

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

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	}

	var qnaPostId = ${
		qnABoardVO.qnaPostId
	};

	var replyPage = 1;

	function getPage(pageInfo) {

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			
			getIndent();
			$("#modifyModal").modal('hide');
			$("#rereplyModal").modal('hide');
			
		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + qnaPostId + "/1");

	});

	$(".pagination").on("click", "li a", function(event) {

		event.preventDefault();

		replyPage = $(this).attr("href");

		getPage("/replies/" + qnaPostId + "/" + replyPage);

	});

	$("#replyAddBtn").on("click", function() {

		var replyerObj = $("#newReplyWriter");
		var replytextObj = $("#newReplyText");
		var userNick = replyerObj.val();
		var qnaCommentContent = replytextObj.val();

		$.ajax({
			type : 'post',
			url : '/replies/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				qnaPostId : qnaPostId,
				userNick : userNick,
				qnaCommentContent : qnaCommentContent
			}),
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/" + qnaPostId + "/" + replyPage);
					replytextObj.val("");
				}
			}
		});
	});

	$(".timeline").on("click", ".replyLi", function(event) {

		var reply = $(this);

		$("#qnaCommentContent").val(reply.find('.timeline-body').text());
		$("#reqnaCommentGroupId").val(reply.find('#qnaCommentGroupId').val());
		$("#reqnaCommentStep").val(reply.find('#qnaCommentStep').val());
		$("#reqnaCommentIndent").val(reply.find('#qnaCommentIndent').val());
		$(".modal-title").html(reply.attr("data-rno"));

	});

	$("#replyModBtn").on("click", function() {

		var qnaCommentId = $(".modal-title").html();
		var qnaCommentContent = $("#qnaCommentContent").val();

		$.ajax({
			type : 'put',
			url : '/replies/' + qnaCommentId,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				qnaCommentContent : qnaCommentContent
			}),
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("수정 되었습니다.");
					getPage("/replies/" + qnaPostId + "/" + replyPage);
				}
			}
		});
	});

	$("#rereplyBtn").on(
			"click",
			function() {
				var qnaCommentContent = $("#reqnaCommentContent").val();
				var qnaCommentGroupId = $("#reqnaCommentGroupId").val();
				var qnaCommentStep = $("#reqnaCommentStep").val();
				var qnaCommentIndent = $("#reqnaCommentIndent").val();
				var userNick = $("#reuserNick").val();

				$.ajax({
					type : 'post',
					url : '/replies/re',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					data : JSON.stringify({
						qnaPostId : qnaPostId,
						qnaCommentContent : qnaCommentContent,
						qnaCommentGroupId : qnaCommentGroupId,
						qnaCommentStep : qnaCommentStep,
						qnaCommentIndent : qnaCommentIndent,
						userNick : userNick
					}),
					dataType : 'text',
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("등록 되었습니다.");
							replyPage = 1;
							getPage("/replies/" + qnaPostId + "/" + replyPage);
						}
					}
				});
			});
	
	function getIndent(){
		var indent = $("div.timeline-item.indent");
		
		$.each(indent, function(index, item){
			
			var num = $(this).attr("data-indent");
			var get = (95-(num*5));
			
			if(num != 0){
				
				$(this).css({
					"width" : get+"%",
					"float" : "right"
					});
				
			}
		});
	}
	
	$("#replyDelBtn").on("click", function() {

		var qnaCommentId = $(".modal-title").html();
		var qnaCommentContent = $("#qnaCommentContent").val();

		$.ajax({
			type : 'delete',
			url : '/replies/' + qnaCommentId,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					getPage("/replies/" + qnaPostId + "/" + replyPage);
				}
			}
		});
	});
</script>


<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$("#modifyBtn").on("click", function() {
			formObj.attr("action", "/qnaboard/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#removeBtn").on("click", function() {
			formObj.attr("action", "/qnaboard/removePage");
			formObj.submit();
		});

		$("#goListBtn ").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/qnaboard/list");
			formObj.submit();
		});

	});
</script>





<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<%@include file="../include/footer.jsp"%>
