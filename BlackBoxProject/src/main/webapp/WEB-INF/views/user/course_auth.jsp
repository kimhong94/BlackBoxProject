<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBP | Log in</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<!-- Bootstrap 3.3.4 -->

<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- iCheck -->
<link href="/resources/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->

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
			<a href="/user/check"><b>BlackBox</b>Project</a>
		</div>

		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">${login.userCollege}<br />${login.userName}(${login.userNick})님 안녕하세요.
			</p>

			<form role="form" method="POST">
				학번 :
				<div class="form-group has-feedback">

					<input type="text" name="userSerial" class="form-control" placeholder="학번" />
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				비밀번호 :
				<div class="form-group has-feedback">
					<input type="password" name="userSerialPw" class="form-control" placeholder="비밀번호" />
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<button type="submit" class="btn btn-primary btn-block btn-flat" id="confirm">교과목 가져오기</button>
			</form>

		</div>
		<!-- /.login-box-body -->


	</div>
	<!-- /.login-box -->


	<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
</body>
</html>