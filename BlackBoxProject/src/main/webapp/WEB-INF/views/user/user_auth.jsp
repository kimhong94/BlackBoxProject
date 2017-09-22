<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/navbar.jsp"%>
<%@include file="../include/carousel.jsp"%>
<body>

	<div class="container" id="login-box"  style="text-align:center;">

		<h2 class="form-signin-heading" style="text-align:center;">회원종류선택</h2>
		<form action="/user/join" role="form" method="get">

			<div class="col-xs-4"  style=" margin-left: 16%;">
				<input type="hidden" name="userAuth" value="p" />
				<button type="submit" class="btn btn-primary btn-block btn-flat">교수</button>
			</div>

		</form>

		<form action="/user/join" role="form" method="get">
			<div class="col-xs-4">
				<input type="hidden" name="userAuth" value="s" />
				<button type="submit" class="btn btn-primary btn-block btn-flat">학생</button>
			</div>

		</form>
		
	</div>
	<!-- /.login-box-body -->
	<!-- /.login-box -->

	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

	<%@include file="../include/footer.jsp"%>