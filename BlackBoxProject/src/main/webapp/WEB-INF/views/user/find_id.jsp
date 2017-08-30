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
			<a href="/user/login"><b>BlackBox</b>Project</a> <br />아이디 찾기
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">회원 가입 때 작성한 정보를 입력해 주세요.</p>

			<form role="form" method="post">

				닉네임 :
				<div class="form-group has-feedback">
					<input type="text" maxlength="20" name="userNick" id="userNick" class="form-control" placeholder="NickName" />
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>



				이메일 :
				<div class="form-group has-feedback">
					<input type="email" maxlength="30" name="userEmail" id="userEmail" class="form-control" placeholder="Email" />
					<span class="glyphicon glyphicon-calendar form-control-feedback"></span>
				</div>

				<div>
					<input type="submit" value="아이디 조회">
					<a href="/user/login">처음으로</a>
				</div>

			</form>

		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->
	<script language="JavaScript" src="/resources/js/userCheck.js?ver=1"></script>
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

		var result = "${msg}";
		if (result == "FAIL") {
			alert("조회하신 아이디가 없습니다.");
		}
	</script>
</body>
</html>