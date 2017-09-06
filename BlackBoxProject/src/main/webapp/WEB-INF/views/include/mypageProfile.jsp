<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container mypageImg"></div>
<div class="container mypage">

	<div class="userInfo">
		<div class="userImage">
			<img src="https://p-flearning.s3.amazonaws.com/uploads/user/avatar/2671/10354686_10150004552801856_220367501106153455_n.jpg" class="user-image" data-reactid=".0.0.0.1.4.0">

		</div>
		<div>
			<h2>${login.userCollege}${login.userSerial}</h2>
			<h3>${login.userName}(${login.userNick})님안녕하세요.</h3>
		</div>

	</div>
	<div>
		<ul class="list-group">
			<li class="list-group-item"><a href="/qnaboard/list">질문과 답변</a></li>
			<li class="list-group-item"><a href="/user/modify">내 계정 변경</a></li>
			<li class="list-group-item"><a href="/user/delete">내 계정 삭제</a></li>
			<li class="list-group-item"><a href="/user/logout">로그아웃</a></li>
		</ul>
	</div>

</div>