<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post" name="register">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Title </label>
							<input type="text" name='qnaPostTitle' id='qnaPostTitle' class="form-control" placeholder="Enter Title">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="qnaPostContent" id='qnaPostContent' rows="3" placeholder="Enter ..."></textarea>
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label>
							<input type="text" name="userNick" class="form-control" value="${login.userNick}" placeholder="Enter Writer" readonly="readonly">
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<div class="col-xs-4">
							<input type="button" value="등록" class="btn btn-primary" onclick="javascript:registerChk();">
							<input type="button" value="취소" class="btn btn-danger" onClick="history.go(-1); return false;">

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
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
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
