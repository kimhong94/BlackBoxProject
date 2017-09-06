<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container checkUser">
		<div>
			<a href="/user/mypage"><img src="https://p-flearning.s3.amazonaws.com/uploads/user/avatar/2671/10354686_10150004552801856_220367501106153455_n.jpg" class="user-image" data-reactid=".0.0.0.1.4.0"> </a>
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