<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<body>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active one">
				<img class="first-slide">
				<div class="container">
					<div class="carousel-caption">

						<h1>Black box project</h1>

						<br /> <br />
						<p>강의 내용을 자동으로 업로드 해드립니다.</p>
						<p>강의 중에 놓친 내용을 확인해 보세요!</p>
						<p>사진, 음성파일, 강의자료 모두 확인 가능합니다.</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#about" role="button">자세히 보기</a>
						</p>
					</div>
				</div>
			</div>
			<div class="item two">
				<img class="second-slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>학교/기관 서비스 신청하기</h1>
						<br /> <br />
						<p>상담을 통해 서비스를 신청하세요!</p>
						<p>
							강의 시작과 종료 버튼 <u>2번의 클릭만으로</u>
						</p>
						<p>모든것이 해결됩니다!</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#contact" role="button">연락 하기</a>
						</p>
					</div>
				</div>
			</div>
			<div class="item three">
				<img class="third-slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>One more for good measure.</h1>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
	<!-- /.carousel -->




	<div class="container" id="login-box">

		<form action="/user/loginPost" method="post" class="form-signin">
			<h2 class="form-signin-heading">BlackBox Project</h2>
			<small>온라인에서 수업자료를 확인해보세요.</small>
			<label for="inputEmail" class="sr-only">Email address</label>
			<input type="text" name="userId" class="form-control" placeholder="USER ID" />
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" name="userPw" class="form-control" placeholder="Password" />
			<div class="checkbox">
				<label>
					<input type="checkbox" name="useCookie">
					Remember Me
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
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});

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
