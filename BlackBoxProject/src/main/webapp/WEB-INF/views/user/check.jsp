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
		<div class="login-logo">
			<img
				src="https://p-flearning.s3.amazonaws.com/uploads/user/avatar/2671/10354686_10150004552801856_220367501106153455_n.jpg"
				class="user-image" data-reactid=".0.0.0.1.4.0"> 안녕하세요 :)

		</div>

		<!-- /.login-logo -->
		<div class="login-box-body">

			<p class="login-box-msg">${userVO.user_college}${userVO.user_serial}<br />${userVO.user_name}(${userVO.user_nick})님
				안녕하세요.
			</p>

			<form action="/user/course_auth/" method="get">

				<button type="submit" class="btn btn-primary btn-block btn-flat"
					id="confirm">학교 인증하기</button>

			</form>

			<a href="/user/logout">로그아웃</a><br> <a href="/user/mypage">My Page</a><br>

			<div class="btn-group" id="course">
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false">
					교과목 선택 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#">Action</a></li>
					<li><a href="#">Another action</a></li>
					<li><a href="#">Something else here</a></li>
					<li class="divider"></li>
					<li><a href="#">Separated link</a></li>
				</ul>
			</div>

		</div>
		<!-- /.login-box-body -->


	</div>

	<script type="text/javascript">
			$(document).ready(function() {
				if (${userVO.user_has_auth} == "1") {
					$("#confirm").hide();
					$("#course").show();
					//버튼이미지 변경
				} else {
					$("#confirm").show();
					$("#course").hide();
				}
			})
	</script>

	<!-- /.login-box -->


	<script src="/resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js"
		type="text/javascript"></script>
</body>
</html>