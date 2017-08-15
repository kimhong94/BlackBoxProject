<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBP | Join</title>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<script language="JavaScript" src="/resources/js/userCheck.js?ver=1"></script>
</head>
<body class="login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="/user/login"><b>BlackBox</b>Project</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">정보변경</p>

			<form role="form" method="post" name="modify">

				아이디 :
				<div class="form-group has-feedback">
					<input type="text" name="user_id" id="user_id" class="form-control"
						maxlength="20" value="${userVO.user_id}" readonly="readonly" /> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>

				이름 :
				<div class="form-group has-feedback">
					<input type="text" maxlength="20" name="user_name" id="user_name"
						class="form-control" value="${userVO.user_name}" /> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>

				닉네임 :
				<div class="form-group has-feedback">
					<input type="text" maxlength="20" name="user_nick" id="user_nick"
						class="form-control" value="${userVO.user_nick}"
						readonly="readonly" /> <span
						class="glyphicon glyphicon-star form-control-feedback"></span>
				</div>

				이메일 :
				<div class="form-group has-feedback">
					<input type="email" maxlength="30" name="user_email"
						id="user_email" class="form-control" value="${userVO.user_email}" />
					<span class="glyphicon glyphicon-calendar form-control-feedback"></span>
				</div>

				핸드폰 번호 :
				<div class="form-group has-feedback">
					<input type="tel" maxlength="30" name="user_phone" id="user_phone"
						class="form-control" value="${userVO.user_phone}" /> <span
						class="glyphicon glyphicon-phone form-control-feedback"></span>
				</div>


				현재 비밀번호 :
				<div class="form-group has-feedback">
					<input type="password" maxlength="20" name="user_old_pw"
						id="user_old_pw" class="form-control" placeholder="Password" /> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>

				<input type="hidden" id="user_old_pw_check"
					value="${userVO.user_pw}"> 새 비밀번호 :
				<div class="form-group has-feedback">
					<input type="password" maxlength="20" name="user_pw" id="user_pw"
						class="form-control" placeholder="Password" /> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>

				새 비밀번호 확인 :
				<div class="form-group has-feedback">
					<input type="password" maxlength="20" name="user_pw_check"
						id="user_pw_check" class="form-control" placeholder="Password" />
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>

				<div class="row">

					<div class="col-xs-4">
						<input type="button" value="정보변경" onclick="modifyChk()">
					</div>

					<div>
						<input type="button" value="취소"
							onclick="location.href='/user/mypage'">
					</div>

				</div>
			</form>

		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js"
		type="text/javascript"></script>

	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>

</body>
</html>