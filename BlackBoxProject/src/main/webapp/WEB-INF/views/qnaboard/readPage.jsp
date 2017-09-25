<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/navbar.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<body class="login-page">
	<div class="container mypageString1">
		<h1>My Page</h1>
	</div>
	<div class="container mypageString2">
		<h2>게시글 보기</h2>
	</div>
	<%@include file="../include/mypageProfile.jsp"%>

	<div class="container qna">
		<section class="content">
			<div style="padding-bottom: 3%; padding-top: 5%;">
				<h1>
					질문과 답변 <small> 게시글 보기</small>
				</h1>
			</div>
			<div style="text-align: left;">
				<!-- left column -->
				<div class="col-md-12">
					<!-- general form elements -->
					<div>
						<form role="form" action="modifyPage" method="post">
							<input type='hidden' name='qnaPostId' value="${qnABoardVO.qnaPostId}">
							<input type="hidden" name="page" value="${cri.page}">
							<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
							<input type='hidden' name='searchType' value="${cri.searchType}">
							<input type='hidden' name='keyword' value="${cri.keyword}">
						</form>

						<div>
							<div class="form-group">
								<label for="exampleInputEmail1">제목</label>
								<input type="text" name='qnaPostTitle' class="form-control" value="${qnABoardVO.qnaPostTitle}" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">내용</label>
								<textarea style="height: 214px;" class="form-control" name=qnaPostContent rows="3" readonly="readonly">${qnABoardVO.qnaPostContent}</textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">작성자</label>
								<input type="text" name="userNick" class="form-control" value="${qnABoardVO.userNick}" readonly="readonly">
							</div>
						</div>

						<div>

							<c:if test="${login.userNick == qnABoardVO.userNick}">
								<button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
								<button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
							</c:if>

							<button type="submit" class="btn btn-default" id="goListBtn">리스트</button>

						</div>



					</div>
				</div>

			</div>
			<!-- /.row -->



			<div style="text-align: left;">
				<div class="col-md-12" style="padding-top: 2%;">

					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="box-title">새 댓글을 달아보세요!</h3>
						</div>
						<div class="panel-body">
							<label for="exampleInputEmail1">작성자</label>
							<input class="form-control" type="text" placeholder="USER ID" id="newReplyWriter" value="${login.userNick }" readonly="readonly">
							<br />
							<label for="exampleInputEmail1">댓글 내용</label>
							<input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">
						</div>
						<div style="padding-left: 1%; padding-bottom: 1%;">
							<button type="button" class="btn btn-info" id="replyAddBtn">댓글 달기</button>
						</div>
					</div>


					<ul class="timeline" style=" list-style:none;">
						<li class="time-label" id="repliesDiv">
						<a> 댓글 리스트 <small id='replycntSmall'> [ ${qnABoardVO.qnaPostReplycnt} ] </small> </a>
						</li>
						
						
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
			<div class="modal modal-default fade" id="modifyModal" role="dialog" aria-labelledby="modalLabel">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="modal-body" data-rno>
							<p>
								<input type="text" id="qnaCommentContent" class="form-control">
							</p>
						</div>
						<div class="modal-footer">
							<div class="btn-group btn-group-justified" role="group" aria-label="group button">
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
								</div>
							</div>
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
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>

					</div>
				</div>
			</div>


		</section>
	</div>




	<!-- /.content -->

	<script id="template" type="text/x-handlebars-template">

{{#each .}}
<div class="row">
	<li class="replyLi" data-rno={{qnaCommentId}}>
	<div class="message-item">
		<div class="message-inner">
			<div class="message-head clearfix">
				
					<div class="timeline-item indent" data-indent={{qnaCommentIndent}}>

							<div class="user-detail">
							<h5 class="handle">
								<strong>{{qnaCommentId}}</strong> -{{userNick}}
							</h5>

							<div class="post-meta">
								<div class="asker-meta">
									<span class="time"> <i class="fa fa-clock-o"></i>{{prettifyDate qnaCommentRegdate}}
									</span>
								</div>
							</div>
						</div>
					</div>
			</div>
			<div class="message-head clearfix">
			<div class="timeline-body">{{qnaCommentContent}}</div></div>
			<input type="hidden" id="qnaCommentGroupId" value="{{qnaCommentGroupId}}">
			<input type="hidden" id="qnaCommentStep" value="{{qnaCommentStep}}">
			<input type="hidden" id="qnaCommentIndent" value="{{qnaCommentIndent}}">

			
			<div class="timeline-footer" >
				{{#eqReplyer userNick}} <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#modifyModal">수정 하기</a> {{/eqReplyer}} <a class="btn btn-info btn-xs" data-toggle="modal" data-target="#rereplyModal">답글 달기</a>
			</div>
	

			
			</div>
		</div>
		</li>
</div>
{{/each}}

</script>

	<script>
		$('.modal ').insertAfter($('body'));

		Handlebars.registerHelper("eqReplyer", function(userNick, block) {
			var accum = '';
			if (userNick == '${login.userNick}') {
				accum += block.fn();
			}
			return accum;
		});

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

		var qnaPostId = ${qnABoardVO.qnaPostId};

		var replyPage = 1;

		function getPage(pageInfo) {

			$.getJSON(pageInfo, function(data) {
				printData(data.list, $("#repliesDiv"), $('#template'));
				printPaging(data.pageMaker, $(".pagination"));

				getIndent();

				$("#replycntSmall").html(
						"[ " + data.pageMaker.totalCount + " ]");
				$("#reqnaCommentContent").val(" ");
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

			if (qnaCommentContent.length == 0) {
				alert("빈칸이 있습니다.");
				return;
			}

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

		$(".timeline").on("click",".replyLi",function(event) {
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

		/*재 댓글 달기  */
		$("#rereplyBtn").on("click", function() {
			var qnaCommentContent = $("#reqnaCommentContent").val();
			var qnaCommentGroupId = $("#reqnaCommentGroupId").val();
			var qnaCommentStep = $("#reqnaCommentStep").val();
			var qnaCommentIndent = $("#reqnaCommentIndent").val();
			var userNick = $("#reuserNick").val();

			if (qnaCommentContent.length == 0) {
				alert("빈칸이 있습니다.");
				return;
			}
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
						getPage("/replies/" + qnaPostId + "/" + replyPage);
					}
				}
			});
		});

		function getIndent() {
			var indent = $("div.timeline-item.indent");

			$.each(indent, function(index, item) {

				var num = $(this).attr("data-indent");
				var get = (95 - (num * 5));

				if (num != 0) {

					$(this).parents(".message-item").css({
						"width" : get + "%",
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
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- FastClick -->
	<script src='/resources/plugins/fastclick/fastclick.min.js'></script>
</body>
</html>