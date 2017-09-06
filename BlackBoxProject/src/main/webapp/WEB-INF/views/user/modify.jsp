<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/navbar.jsp"%>
<body class="login-page">
	<div class="container mypageString1">
		<h1>My Page</h1>
	</div>
	<div class="container mypageString2">
		<h2>내 계정 변경</h2>
	</div>
	<%@include file="../include/mypageProfile.jsp"%>

	<div class="container modify">

		<!-- /.login-logo -->


		<form role="form" method="post" name="modify">

			<strong>아이디 </strong>
			<div class="form-group has-feedback">
				<input type="text" name="userId" id="userId" class="form-control" maxlength="20" value="${login.userId}" readonly="readonly" />
				<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>

			<strong>이름 </strong>
			<div class="form-group has-feedback">
				<input type="text" maxlength="20" name="userName" id="userName" class="form-control" value="${login.userName}" />
				<span class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>

			<strong>닉네임 </strong>
			<div class="form-group has-feedback">
				<input type="text" maxlength="20" name="userNick" id="userNick" class="form-control" value="${login.userNick}" readonly="readonly" />
				<span class="glyphicon glyphicon-star form-control-feedback"></span>
			</div>

			<strong>이메일 </strong>
			<div class="form-group has-feedback">
				<input type="email" maxlength="30" name="userEmail" id="userEmail" class="form-control" value="${login.userEmail}" />
				<span class="glyphicon glyphicon-calendar form-control-feedback"></span>
			</div>

			<strong>핸드폰 번호 </strong>
			<div class="form-group has-feedback">
				<input type="tel" maxlength="30" name="userPhone" id="userPhone" class="form-control" value="${login.userPhone}" />
				<span class="glyphicon glyphicon-phone form-control-feedback"></span>
			</div>


			<strong>현재 비밀번호</strong>
			<div class="form-group has-feedback">
				<input type="password" maxlength="20" name="userOldPw" id="userOldPw" class="form-control" placeholder="Password" />
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>

			<input type="hidden" id="userOldPwCheck" value="${login.userPw}">

			<strong>새 비밀번호 </strong>
			<div class="form-group has-feedback">
				<input type="password" maxlength="20" name="userPw" id="userPw" class="form-control" placeholder="Password" />
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>

			<strong>새 비밀번호 확인</strong>
			<div class="form-group has-feedback">
				<input type="password" maxlength="20" name="userPwCheck" id="userPwCheck" class="form-control" placeholder="Password" />
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>

			<div class="row">

				<div class="col-xs-4">
					<input type="button" value="정보변경" onclick="modifyChk()" class="btn btn-info">
				</div>

				<div>
					<input type="button" value="취소" onclick="location.href='/user/mypage'" class="btn btn-default">
				</div>

			</div>
		</form>

		<!-- /.login-box-body -->
	</div>

	<%@include file="../include/footer.jsp"%>


	<!-- /.login-box -->
	<script language="JavaScript" src="/resources/js/userCheck.js"></script>
	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("재 로그인 후 정보가 반영 됩니다.");
		}
	</script>
</html>