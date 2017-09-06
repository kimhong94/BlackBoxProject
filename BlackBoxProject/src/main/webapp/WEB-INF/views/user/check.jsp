<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/navbar.jsp"%>
<%@include file="../include/carousel.jsp"%>
<body>

	<%@include file="../include/profile.jsp"%>
	<div class="container check">
		<div class="notice">
			<h2>공지 사항</h2>
			<ol>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
			</ol>
		</div>
		<div class="recentReply">
			<h2>나의 최근 댓글</h2>
			<ol>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
				<li>댓글테스트</li>
			</ol>
		</div>
	</div>
	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>


	<!-- /.login-box -->
	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
			location.replace(self.location);
		} else if (result == 'FAIL') {
			alert("교과목 가져오기를 실패했습니다.\n학번과 비밀번호를 확인해주세요.");
			location.replace(self.location);
		}
	</script>

	<%@include file="../include/footer.jsp"%>