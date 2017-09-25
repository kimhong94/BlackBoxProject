
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
						<a class="btn btn-lg btn-primary" href="#about" class="Bcenter" role="button">자세히 보기</a>
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
						<a class="btn btn-lg btn-primary" href="#contact" class="Bcenter" role="button">연락 하기</a>
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