<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/navbar.jsp"%>
<body class="login-page">
	<div class="container mypageString1">
		<h1>My Page</h1>
	</div>
	<%@include file="../include/mypageProfile.jsp"%>

	<div class="container qna"></div>


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