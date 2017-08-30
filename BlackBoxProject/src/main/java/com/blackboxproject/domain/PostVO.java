package com.blackboxproject.domain;

import java.sql.Timestamp;

//전남대학교 
public class PostVO {

 // 게시글 아이디 
 private Integer postId;

 // 교과목 번호 
 private Integer courseId;

 // 게시판 분류번호 
 private Integer boardId;

 // 게시글 제목 
 private String postTitle;

 // 게시글 내용 
 private String postContent;

 // 조회수 
 private Integer postView;

 // 회원 닉네임 
 private String userNick;

 // 게시글 등록날짜 
 private Timestamp postRegdate;

 public Integer getPostId() {
     return postId;
 }

 public void setPostId(Integer postId) {
     this.postId = postId;
 }

 public Integer getCourseId() {
     return courseId;
 }

 public void setCourseId(Integer courseId) {
     this.courseId = courseId;
 }

 public Integer getBoardId() {
     return boardId;
 }

 public void setBoardId(Integer boardId) {
     this.boardId = boardId;
 }

 public String getPostTitle() {
     return postTitle;
 }

 public void setPostTitle(String postTitle) {
     this.postTitle = postTitle;
 }

 public String getPostContent() {
     return postContent;
 }

 public void setPostContent(String postContent) {
     this.postContent = postContent;
 }

 public Integer getPostView() {
     return postView;
 }

 public void setPostView(Integer postView) {
     this.postView = postView;
 }

 public String getUserNick() {
     return userNick;
 }

 public void setUserNick(String userNick) {
     this.userNick = userNick;
 }

 public Timestamp getPostRegdate() {
     return postRegdate;
 }

 public void setPostRegdate(Timestamp postRegdate) {
     this.postRegdate = postRegdate;
 }

 // JnuPost 모델 복사
 public void CopyData(PostVO param)
 {
     this.postId = param.getPostId();
     this.courseId = param.getCourseId();
     this.boardId = param.getBoardId();
     this.postTitle = param.getPostTitle();
     this.postContent = param.getPostContent();
     this.postView = param.getPostView();
     this.userNick = param.getUserNick();
     this.postRegdate = param.getPostRegdate();
 }
}