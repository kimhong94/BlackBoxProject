package com.blackboxproject.domain;

import java.sql.Timestamp;

//QnA 댓글 
public class QnAReplyVO {

 // 게시글 아이디 
 private Integer qnaPostId;

 // 댓글 아이디 
 private Integer qnaCommentId;

 // 댓글 작성자 
 private String userNick;

 // 댓글 내용 
 private String qnaCommentContent;

 // 댓글 등록날짜 
 private Timestamp qnaCommentRegdate;

 // 댓글 순서 
 private Integer qnaCommentStep;

 // 댓글 들여쓰기 
 private Integer qnaCommentIndent;

 // 댓글 그룹 아이디 
 private Integer qnaCommentGroupId;

 // 댓글 업데이트 날짜 
 private Timestamp qnaCommentUpdateDate;

 public Integer getQnaPostId() {
     return qnaPostId;
 }

 public void setQnaPostId(Integer qnaPostId) {
     this.qnaPostId = qnaPostId;
 }

 public Integer getQnaCommentId() {
     return qnaCommentId;
 }

 public void setQnaCommentId(Integer qnaCommentId) {
     this.qnaCommentId = qnaCommentId;
 }

 public String getUserNick() {
     return userNick;
 }

 public void setUserNick(String userNick) {
     this.userNick = userNick;
 }

 public String getQnaCommentContent() {
     return qnaCommentContent;
 }

 public void setQnaCommentContent(String qnaCommentContent) {
     this.qnaCommentContent = qnaCommentContent;
 }

 public Timestamp getQnaCommentRegdate() {
     return qnaCommentRegdate;
 }

 public void setQnaCommentRegdate(Timestamp qnaCommentRegdate) {
     this.qnaCommentRegdate = qnaCommentRegdate;
 }

 public Integer getQnaCommentStep() {
     return qnaCommentStep;
 }

 public void setQnaCommentStep(Integer qnaCommentStep) {
     this.qnaCommentStep = qnaCommentStep;
 }

 public Integer getQnaCommentIndent() {
     return qnaCommentIndent;
 }

 public void setQnaCommentIndent(Integer qnaCommentIndent) {
     this.qnaCommentIndent = qnaCommentIndent;
 }

 public Integer getQnaCommentGroupId() {
     return qnaCommentGroupId;
 }

 public void setQnaCommentGroupId(Integer qnaCommentGroupId) {
     this.qnaCommentGroupId = qnaCommentGroupId;
 }

 public Timestamp getQnaCommentUpdateDate() {
     return qnaCommentUpdateDate;
 }

 public void setQnaCommentUpdateDate(Timestamp qnaCommentUpdateDate) {
     this.qnaCommentUpdateDate = qnaCommentUpdateDate;
 }

 // QnaComment 모델 복사
 public void CopyData(QnAReplyVO param)
 {
     this.qnaPostId = param.getQnaPostId();
     this.qnaCommentId = param.getQnaCommentId();
     this.userNick = param.getUserNick();
     this.qnaCommentContent = param.getQnaCommentContent();
     this.qnaCommentRegdate = param.getQnaCommentRegdate();
     this.qnaCommentStep = param.getQnaCommentStep();
     this.qnaCommentIndent = param.getQnaCommentIndent();
     this.qnaCommentGroupId = param.getQnaCommentGroupId();
     this.qnaCommentUpdateDate = param.getQnaCommentUpdateDate();
 }

@Override
public String toString() {
	return "QnAReplyVO [qnaPostId=" + qnaPostId + ", qnaCommentId=" + qnaCommentId + ", userNick=" + userNick
			+ ", qnaCommentContent=" + qnaCommentContent + ", qnaCommentRegdate=" + qnaCommentRegdate
			+ ", qnaCommentStep=" + qnaCommentStep + ", qnaCommentIndent=" + qnaCommentIndent + ", qnaCommentGroupId="
			+ qnaCommentGroupId + ", qnaCommentUpdateDate=" + qnaCommentUpdateDate + "]";
}
 
 
}
