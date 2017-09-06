<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/navbar.jsp"%>
<body class="login-page">
	<div class="container mypageString1">
		<h1>My Page</h1>
	</div>

	<div class="container mypageString2">
		<h2>내 계정 삭제</h2>
	</div>
	<%@include file="../include/mypageProfile.jsp"%>

	<div class="container delete">
		<form role="form" method="post" name="delUser">
			<h4 style="text-align: center;">
				계정을 삭제하면 내가 만든 모든것이 삭제됩니다. <br />되돌릴 수 없습니다.
			</h4>
			<br /> <br /> <br /> <br /> <br /> <br />
			<div style="padding-left:20%;">
				<input type="checkbox" name="userDelete" value="delete" id="userDelete" />
				<strong>내용을 읽었으며 이에 동의합니다.</strong>

				<input type="hidden" name="userId" value="${login.userId}">

				<input type="button" value="계정삭제" class="btn btn-danger" onclick="deleteChk()">
			</div>
		</form>

	</div>


	<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("재 로그인 후 정보가 반영 됩니다.");
		}
	</script>

	<%@include file="../include/footer.jsp"%>