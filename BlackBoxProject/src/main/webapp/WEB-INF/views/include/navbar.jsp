<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- iCheck -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>


<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<head>
<meta charset="UTF-8">
<title>BBProject</title>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/carousel.css?ver=1">
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/reply.css?ver=1">
</head>

<body>

	<div class="bbp">
		<h1>ReLearning</h1>
	</div>
	<div class="navbar-wrapper">

		<div class="container">
			<nav class="navbar navbar-default">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="true" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<a class="navbar-brand active" href="/user/login">BBPoject</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li><a href="/user/login">Home</a></li>
							<li><a href="#about">About</a></li>
							<li><a href="#contact">Contact</a></li>
							<c:if test="${login.userId != null}">
								<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="/user/mypage">My Page <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="/qnaboard/list">질문과 답변</a></li>
										<li><a href="/user/modify">내 계정 변경</a></li>
										<li><a href="/user/delete">내 계정 삭제</a></li>
										<li><a href="/user/logout">로그아웃</a></li>
									</ul></li>
							</c:if>
						</ul>
					</div>
				</div>
			</nav>

		</div>
	</div>
	
	
