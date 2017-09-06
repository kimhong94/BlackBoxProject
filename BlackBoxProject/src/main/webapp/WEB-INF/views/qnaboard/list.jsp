<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<%@include file="../include/navbar.jsp"%>
<div class="container mypageString1">
	<h1>My Page</h1>
</div>
<div class="container mypageString2">
	<h2>질문과 답변</h2>
</div>


<%@include file="../include/mypageProfile.jsp"%>

<div class="container qna">


	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- left column -->


			<div class="col-md-12" style="padding-top: 4%;">
				<div>
					<div>
						<h3>무엇이든 물어보세요.</h3>
					</div>
					<div style="float: left; padding-top: 2%; padding-bottom: 1%;" class="form-inline">
						<select name="searchType" class="form-control">
							<option value="n" <c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
							<option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							Title</option>
							<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							Content</option>
							<option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							Writer</option>
							<option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							Title OR Content</option>
							<option value="cw" <c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							Content OR Writer</option>
							<option value="tcw" <c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							Title OR Content OR Writer</option>
						</select>
						<input class="form-control" type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
						<button class="btn btn-info" id='searchBtn'>Search</button>
						<button class="btn btn-default" id='newBtn'>New Board</button>
					</div>
					<div>
						<table class="table table-condensed">
							<tr>
								<th style="width: 10%">NO</th>
								<th style="width: 30%">제목</th>
								<th style="width: 15%">작성자</th>
								<th style="width: 30%">등록 날짜</th>
								<th style="width: 15%">조회수</th>
							</tr>

							<c:forEach items="${list}" var="qnABoardVO">

								<tr>
									<td>${qnABoardVO.qnaPostId}</td>
									<td>
										<a href='/qnaboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&qnaPostId=${qnABoardVO.qnaPostId}'> ${qnABoardVO.qnaPostTitle} <strong>[ ${qnABoardVO.qnaPostReplycnt} ]</strong>
										</a>
									</td>
									<td>${qnABoardVO.userNick}</td>
									<td>
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnABoardVO.qnaPostRegdate}" />
									</td>
									<td>
										<span class="badge bg-red">${qnABoardVO.qnaPostView}</span>
									</td>
								</tr>

							</c:forEach>

						</table>
					</div>
					<!-- /.box-body -->


					<div>
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>

					</div>
				</div>
			</div>

		</div>
	</section>
</div>




<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
		location.replace(self.location);
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>

<%@include file="../include/footer.jsp"%>
