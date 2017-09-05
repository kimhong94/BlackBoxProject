package com.blackboxproject.domain;

import java.sql.Timestamp;

//board/날짜/...    lecture/날짜/... 
public class FileVO {

 // 서버저장파일명 
 private String fileName;

 // 게시글아이디 
 private Integer postId;

 // 등록날짜 
 private Timestamp fileRegdate;

 // 원래파일명 
 private String fileOriginname;

 // 회원 닉네임 
 private String userNick;

 @Override
public String toString() {
	return "FileVO [fileName=" + fileName + ", postId=" + postId + ", fileRegdate=" + fileRegdate + ", fileOriginname="
			+ fileOriginname + ", userNick=" + userNick + "]";
}

public String getFileName() {
     return fileName;
 }

 public void setFileName(String fileName) {
     this.fileName = fileName;
 }

 public Integer getPostId() {
     return postId;
 }

 public void setPostId(Integer postId) {
     this.postId = postId;
 }

 public Timestamp getFileRegdate() {
     return fileRegdate;
 }

 public void setFileRegdate(Timestamp fileRegdate) {
     this.fileRegdate = fileRegdate;
 }

 public String getFileOriginname() {
     return fileOriginname;
 }

 public void setFileOriginname(String fileOriginname) {
     this.fileOriginname = fileOriginname;
 }

 public String getUserNick() {
     return userNick;
 }

 public void setUserNick(String userNick) {
     this.userNick = userNick;
 }

 // JnuFile 모델 복사
 public void CopyData(FileVO param)
 {
     this.fileName = param.getFileName();
     this.postId = param.getPostId();
     this.fileRegdate = param.getFileRegdate();
     this.fileOriginname = param.getFileOriginname();
     this.userNick = param.getUserNick();
 }
}