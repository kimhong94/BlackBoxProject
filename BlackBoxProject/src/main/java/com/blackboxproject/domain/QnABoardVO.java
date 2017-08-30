package com.blackboxproject.domain;

import java.sql.Timestamp;

//QnA 게시판 
public class QnABoardVO {

	// 게시글 아이디
	private Integer qnaPostId;

	// 게시글 제목
	private String qnaPostTitle;

	// 게시글 내용
	private String qnaPostContent;

	// 조회수
	private Integer qnaPostView;

	// 회원 닉네임
	private String userNick;

	// 게시글 등록날짜
	private Timestamp qnaPostRegdate;

	public Integer getQnaPostId() {
		return qnaPostId;
	}

	public void setQnaPostId(Integer qnaPostId) {
		this.qnaPostId = qnaPostId;
	}

	public String getQnaPostTitle() {
		return qnaPostTitle;
	}

	public void setQnaPostTitle(String qnaPostTitle) {
		this.qnaPostTitle = qnaPostTitle;
	}

	public String getQnaPostContent() {
		return qnaPostContent;
	}

	public void setQnaPostContent(String qnaPostContent) {
		this.qnaPostContent = qnaPostContent;
	}

	public Integer getQnaPostView() {
		return qnaPostView;
	}

	public void setQnaPostView(Integer qnaPostView) {
		this.qnaPostView = qnaPostView;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public Timestamp getQnaPostRegdate() {
		return qnaPostRegdate;
	}

	public void setQnaPostRegdate(Timestamp qnaPostRegdate) {
		this.qnaPostRegdate = qnaPostRegdate;
	}

	// QnaBoard 모델 복사
	public void CopyData(QnABoardVO param) {
		this.qnaPostId = param.getQnaPostId();
		this.qnaPostTitle = param.getQnaPostTitle();
		this.qnaPostContent = param.getQnaPostContent();
		this.qnaPostView = param.getQnaPostView();
		this.userNick = param.getUserNick();
		this.qnaPostRegdate = param.getQnaPostRegdate();
	}

	@Override
	public String toString() {
		return "QnaBoardVO [qnaPostId=" + qnaPostId + ", qnaPostTitle=" + qnaPostTitle + ", qnaPostContent="
				+ qnaPostContent + ", qnaPostView=" + qnaPostView + ", userNick=" + userNick + ", qnaPostRegdate="
				+ qnaPostRegdate + "]";
	}

}
