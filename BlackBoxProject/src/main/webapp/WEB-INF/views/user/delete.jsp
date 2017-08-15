<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBP | Log in</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->

<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- iCheck -->
<link href="/resources/plugins/iCheck/square/blue.css" rel="stylesheet"
	type="text/css" />

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->

<script language="JavaScript" src="/resources/js/userCheck.js"></script>
</head>
<body class="login-page">

	<div class="login-box">
		<div class="login-logo">
			<a href="/user/check"><b>BlackBox</b>Project</a>

		</div>
		<div class="login-logo">
			<img
				src="https://p-flearning.s3.amazonaws.com/uploads/user/avatar/2671/10354686_10150004552801856_220367501106153455_n.jpg"
				class="user-image" data-reactid=".0.0.0.1.4.0"> 계정 삭제
		</div>

		<!-- /.login-logo -->
		<div class="login-box-body">

			<p class="login-box-msg">${userVO.user_college}${userVO.user_serial}<br />${userVO.user_name}(${userVO.user_nick})님
				안녕하세요.
			</p>

		</div>
		<!-- /.login-box-body -->



	</div>
	<!-- /.login-box -->
	<div class="login-box">
		<div class="login-box-body">

			<form role="form" method="post" name="delUser">
				<h3>
					<span class="label label-warning">계정을 삭제하면 내가 만든 모든것이 삭제됩니다.
						되돌릴 수 없습니다.</span>
				</h3>
				<input type="checkbox" name="user_delete" value="delete"
					id="user_delete" />내용을 읽었으며 이에 동의합니다.

				<div class="col-xs-4">
					<input type="hidden" name="user_id" value="${userVO.user_id}">
					<input type="button" value="계정삭제" onclick="deleteChk()">
				</div>
			</form>

		</div>
	</div>

	<script src="/resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js"
		type="text/javascript"></script>
</body>
</html>