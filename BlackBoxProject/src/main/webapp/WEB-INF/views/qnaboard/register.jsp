
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/navbar.jsp"%>
<body class="login-page">
	<div class="container mypageString1">
		<h1>My Page</h1>
	</div>
	<div class="container mypageString2">
		<h2>글 작성하기</h2>
	</div>
	<%@include file="../include/mypageProfile.jsp"%>

	<div class="container qna">
		<section class="contentNew">
			<div style="padding-bottom: 3%;">
				<h1>
					질문과 답변 <small> 글 작성하기</small>
				</h1>
			</div>

			<div class="row">
				<!-- left column -->
				<div class="col-md-6">
					<!-- general form elements -->
					<div>

						<form role="form" method="post" name="register">
							<div>
								<div class="form-group">
									<label for="exampleInputEmail1">제목 </label>
									<input type="text" name='qnaPostTitle' id='qnaPostTitle' class="form-control" placeholder="Enter Title">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">내용</label>
									<textarea style="height: 214px;" class="form-control" name="qnaPostContent" id='qnaPostContent' rows="3" placeholder="Enter ..."></textarea>
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">작성자</label>
									<input type="text" name="userNick" class="form-control" value="${login.userNick}" placeholder="Enter Writer" readonly="readonly">
								</div>
							</div>
							<!-- /.box-body -->

							<div>
								<div class="col-xs-4">
									<input type="button" value="등록" class="btn btn-info" onclick="javascript:registerChk();">
									<input type="button" value="취소" class="btn btn-default" onClick="history.go(-1); return false;">

								</div>
							</div>
						</form>


					</div>
					<!-- /.box -->
				</div>
				<!--/.col (left) -->

			</div>
			<!-- /.row -->
		</section>
	</div>


	<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

	<script>
		function registerChk() {

			var title = $("#qnaPostTitle").val();
			var content = $("#qnaPostContent").val();
			if (title.length == 0 || content.length == 0) {
				alert("빈칸이 있습니다.");
				return;
			}
			document.register.submit();
		}
	</script>



	<%@include file="../include/footer.jsp"%>