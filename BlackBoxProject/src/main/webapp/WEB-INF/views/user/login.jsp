<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/navbar.jsp"%>
<%@include file="../include/carousel.jsp"%>
<body>





	<div class="container" id="login-box">

		<form action="/user/loginPost" method="post" class="form-signin">
			<h2 class="form-signin-heading">BlackBox Project</h2>
			<small>온라인에서 수업자료를 확인해보세요.</small>
			<label for="inputEmail" class="sr-only">아이디</label>
			<input type="text" name="userId" class="form-control" placeholder="아이디" />

			<label for="inputPassword" class="sr-only">비밀번호</label>
			<input type="password" name="userPw" class="form-control" placeholder="비밀번호" />
			<div class="checkbox">
				<label>
				<input type="checkbox" name="useCookie">로그인 상태 유지
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
			<a href="/user/find_id">아이디 찾기 </a>/<a href="/mail/find_pw"> 비밀번호 찾기</a><br> <a href="/user/user_auth" class="text-center">회원가입</a>
		</form>

	</div>

	<!-- /container -->
	<!-- /.login-box -->

	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}
		var modifyresult = '${modifyMsg}';

		if (modifyresult != '') {
			alert(modifyresult);
		}
	</script>

	<%@include file="../include/footer.jsp"%>