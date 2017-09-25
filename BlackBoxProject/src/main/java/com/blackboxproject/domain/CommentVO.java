package com.blackboxproject.domain;

import java.sql.Timestamp;

public class CommentVO {

	// 게시글 아이디
	private Integer postId;

	// 댓글 아이디
	private Integer commentId;

	// 댓글 작성자
	private String userNick;

	// 댓글 내용
	private String commentContent;

	// 댓글 등록날짜
	private Timestamp commentRegdate;

	// 댓글 순서
	private Integer commentStep;

	// 댓글 들여쓰기
	private Integer commentIndent;

	// 댓글 그룹 아이디
	private Integer commentGroupId;

	// 댓글 업데이트 날짜
	private Timestamp commentUpdateDate;

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Timestamp getCommentRegdate() {
		return commentRegdate;
	}

	public void setCommentRegdate(Timestamp commentRegdate) {
		this.commentRegdate = commentRegdate;
	}

	public Integer getCommentStep() {
		return commentStep;
	}

	public void setCommentStep(Integer commentStep) {
		this.commentStep = commentStep;
	}

	public Integer getCommentIndent() {
		return commentIndent;
	}

	public void setCommentIndent(Integer commentIndent) {
		this.commentIndent = commentIndent;
	}

	public Integer getCommentGroupId() {
		return commentGroupId;
	}

	public void setCommentGroupId(Integer commentGroupId) {
		this.commentGroupId = commentGroupId;
	}

	public Timestamp getCommentUpdateDate() {
		return commentUpdateDate;
	}

	public void setCommentUpdateDate(Timestamp commentUpdateDate) {
		this.commentUpdateDate = commentUpdateDate;
	}

	// JnuComment 모델 복사
	public void CopyData(CommentVO param) {
		this.postId = param.getPostId();
		this.commentId = param.getCommentId();
		this.userNick = param.getUserNick();
		this.commentContent = param.getCommentContent();
		this.commentRegdate = param.getCommentRegdate();
		this.commentStep = param.getCommentStep();
		this.commentIndent = param.getCommentIndent();
		this.commentGroupId = param.getCommentGroupId();
		this.commentUpdateDate = param.getCommentUpdateDate();
	}

	@Override
	public String toString() {
		return "CommentVO [postId=" + postId + ", commentId=" + commentId + ", userNick=" + userNick
				+ ", commentContent=" + commentContent + ", commentRegdate=" + commentRegdate + ", commentStep="
				+ commentStep + ", commentIndent=" + commentIndent + ", commentGroupId=" + commentGroupId
				+ ", commentUpdateDate=" + commentUpdateDate + "]";
	}

}