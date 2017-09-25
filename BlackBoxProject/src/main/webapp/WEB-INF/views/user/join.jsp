<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/navbar.jsp"%>
<%@include file="../include/carousel.jsp"%>
<%@ page session="false"%>
<body>

	<div class="container join">

		<div class="login-page">

		<form role="form" method="post" name="join">
			<h2 style="text-align:center;">회원 가입</h2>
			아이디 :
			<div class="form-group has-feedback">
				<input type="text" name="userId" id="userId" class="form-control" placeholder="USER ID" maxlength="20" />
				<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>
			<!-- 아이디 중복 확인 버튼 -->
			<input type="button" value="아이디 중복 확인" onclick="javascript:chkDupId();" class="btn btn-primary btn-block btn-flat" />
			<!-- 아이디 중복확인 체크 여부 -->
			<input type="hidden" id="idChk" value="N" />



			비밀번호 :
			<div class="form-group has-feedback">
				<input type="password" name="userPw" id="userPw" class="form-control" placeholder="Password" />
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>

			비밀번호 확인 :
			<div class="form-group has-feedback">
				<input type="password" name="userPwCheck" id="userPwCheck" class="form-control" placeholder="Password" />
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>

			이름 :
			<div class="form-group has-feedback">
				<input type="text" name="userName" id="userName" class="form-control" placeholder="Name(한글)" />
				<span class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			닉네임 :
			<div class="form-group has-feedback">
				<input type="text" name="userNick" id="userNick" class="form-control" placeholder="NickName(영어)" />
				<span class="glyphicon glyphicon-star form-control-feedback"></span>
			</div>

			<!-- 닉네임 중복 확인 버튼 -->
			<input type="button" value="닉네임 중복 확인" onclick="javascript:chkDupNick();" class="btn btn-primary btn-block btn-flat" />
			<!-- 아이디 중복확인 체크 여부 -->
			<input type="hidden" id="nickChk" value="N" />

			이메일 :
			<div class="form-group has-feedback">
				<input type="email" name="userEmail" id="userEmail" class="form-control" placeholder="Email" />
				<span class="glyphicon glyphicon-calendar form-control-feedback"></span>
			</div>

			핸드폰 번호 :
			<div class="form-group has-feedback">
				<input type="tel" name="userPhone" id="userPhone" class="form-control" placeholder="Phone Number(01012345678)" />
				<span class="glyphicon glyphicon-phone form-control-feedback"></span>
			</div>

			<div class="form-group has-feedback">
				남성
				<input type="checkbox" name="userSex" value="man" id="userSexMan" />
				여성
				<input type="checkbox" name="userSex" value="woman" id="userSexWoman" />
			</div>


			<input type="hidden" name="userCollege" value="전남대학교" />
			<div class="row">
				<div class="col-xs-4">
					<input type="button" class="btn btn-info" value="회원가입" onclick="insertChk()">

				</div>
				<div>
					<input type="button" class="btn btn-default"value="취소" onclick="location.href='/user/login'">
				</div>
			</div>
		</form>
		</div>
		
	</div>
	<!-- /.login-box -->
	<script language="JavaScript" src="/resources/js/userCheck.js"></script>
	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

	<%@include file="../include/footer.jsp"%>