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
			<a href="/user/login"><b>BlackBox</b>Project</a> <br />아이디 찾기
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">검색 결과</p>

			<form role="form" method="post">

				조회하신 아이디 :
				<div class="form-group has-feedback">
					<input type="text" value="${userVO.user_id}" readonly="readonly" class="form-control" /> <span class="glyphicon glyphicon-user form-control-feedback"></span>
				가입 날짜 : 
				<input type="text" value="${userVO.user_regdate}" readonly="readonly" class="form-control" /> <span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>

			</form>
			<a href="/user/login">처음으로</a>
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



</body>
</html>