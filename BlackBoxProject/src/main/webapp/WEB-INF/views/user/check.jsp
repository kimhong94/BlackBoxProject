<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/navbar.jsp"%>
<%@include file="../include/carousel.jsp"%>
<body>

	<div class="container checkUser">
		<div>
			<img src="https://p-flearning.s3.amazonaws.com/uploads/user/avatar/2671/10354686_10150004552801856_220367501106153455_n.jpg" class="user-image" data-reactid=".0.0.0.1.4.0">

		</div>
		<!-- /.login-logo -->
		<div>
			<h2>${login.userCollege}${login.userSerial}</h2>
			<h3>${login.userName}(${login.userNick})님안녕하세요.</h3>


			<c:if test="${login.userHasAuth == 0}">
				<form action="/user/course_auth/" method="get">
					<button type="submit" class="btn btn-primary btn-block btn-flat" id="confirm">학교 인증하기</button>
				</form>
			</c:if>

			<c:if test="${login.userHasAuth == 1}">
				<div class="dropdown" id="course">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						교과목 선택 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<c:forEach var="course" items="${course}">
							<li><a href="/courses/${course.courseId}">${course.courseName}(${course.courseClass})</a></li>
						</c:forEach>
					</ul>
				</div>
			</c:if>

		</div>





	</div>
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