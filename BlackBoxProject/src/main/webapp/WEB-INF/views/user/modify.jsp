<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBP | Join</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<!-- Bootstrap 3.3.4 -->

<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- iCheck -->
<link href="/resources/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


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
					<input type="text" name="userId" id="userId" class="form-control" maxlength="20" value="${login.userId}" readonly="readonly" />
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>

				이름 :
				<div class="form-group has-feedback">
					<input type="text" maxlength="20" name="userName" id="userName" class="form-control" value="${login.userName}" />
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>

				닉네임 :
				<div class="form-group has-feedback">
					<input type="text" maxlength="20" name="userNick" id="userNick" class="form-control" value="${login.userNick}" readonly="readonly" />
					<span class="glyphicon glyphicon-star form-control-feedback"></span>
				</div>

				이메일 :
				<div class="form-group has-feedback">
					<input type="email" maxlength="30" name="userEmail" id="userEmail" class="form-control" value="${login.userEmail}" />
					<span class="glyphicon glyphicon-calendar form-control-feedback"></span>
				</div>

				핸드폰 번호 :
				<div class="form-group has-feedback">
					<input type="tel" maxlength="30" name="userPhone" id="userPhone" class="form-control" value="${login.userPhone}" />
					<span class="glyphicon glyphicon-phone form-control-feedback"></span>
				</div>


				현재 비밀번호 :
				<div class="form-group has-feedback">
					<input type="password" maxlength="20" name="userOldPw" id="userOldPw" class="form-control" placeholder="Password" />
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>

				<input type="hidden" id="userOldPwCheck" value="${login.userPw}">

				새 비밀번호 :
				<div class="form-group has-feedback">
					<input type="password" maxlength="20" name="userPw" id="userPw" class="form-control" placeholder="Password" />
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>

				새 비밀번호 확인 :
				<div class="form-group has-feedback">
					<input type="password" maxlength="20" name="userPwCheck" id="userPwCheck" class="form-control" placeholder="Password" />
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>

				<div class="row">

					<div class="col-xs-4">
						<input type="button" value="정보변경" onclick="modifyChk()">
					</div>

					<div>
						<input type="button" value="취소" onclick="location.href='/user/mypage'">
					</div>

				</div>
			</form>

		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->
	<script language="JavaScript" src="/resources/js/userCheck.js"></script>
	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

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