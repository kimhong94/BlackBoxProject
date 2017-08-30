package com.blackboxproject.domain;

import java.sql.Timestamp;

//세션에 보관되는 것을 관리하는 클래스
//사용자 
//사용자 
public class UserVO {

	// 회원 아이디
	private String userId;

	// 회원 비밀번호
	private String userPw;

	private String userPwCheck;

	// 회원 닉네임
	private String userNick;

	// 회원 이름
	private String userName;

	// 회원 학번
	private String userSerial;

	// 회원 이메일
	private String userEmail;

	// 회원 권한
	private String userAuth;

	// 회원 전화번호
	private String userPhone;

	// 회원 성별
	private String userSex;

	// 회원 인증 여부
	private Integer userHasAuth;

	// 회원 대학교
	private String userCollege;

	// 회원 세션
	private String userSessionkey;

	// 회원 세션 유효시간
	private Timestamp userSessionlimit;

	// 회원 생성 날짜
	private Timestamp userRegdate;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserPwCheck() {
		return userPwCheck;
	}

	public void setUserPwCheck(String userPwCheck) {
		this.userPwCheck = userPwCheck;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserSerial() {
		return userSerial;
	}

	public void setUserSerial(String userSerial) {
		this.userSerial = userSerial;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAuth() {
		return userAuth;
	}

	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public Integer getUserHasAuth() {
		return userHasAuth;
	}

	public void setUserHasAuth(Integer userHasAuth) {
		this.userHasAuth = userHasAuth;
	}

	public String getUserCollege() {
		return userCollege;
	}

	public void setUserCollege(String userCollege) {
		this.userCollege = userCollege;
	}

	public String getUserSessionkey() {
		return userSessionkey;
	}

	public void setUserSessionkey(String userSessionkey) {
		this.userSessionkey = userSessionkey;
	}

	public Timestamp getUserSessionlimit() {
		return userSessionlimit;
	}

	public void setUserSessionlimit(Timestamp userSessionlimit) {
		this.userSessionlimit = userSessionlimit;
	}

	public Timestamp getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(Timestamp userRegdate) {
		this.userRegdate = userRegdate;
	}

	// User 모델 복사
	public void CopyData(UserVO param) {
		this.userId = param.getUserId();
		this.userPw = param.getUserPw();
		this.userPwCheck = param.getUserPwCheck();
		this.userNick = param.getUserNick();
		this.userName = param.getUserName();
		this.userSerial = param.getUserSerial();
		this.userEmail = param.getUserEmail();
		this.userAuth = param.getUserAuth();
		this.userPhone = param.getUserPhone();
		this.userSex = param.getUserSex();
		this.userHasAuth = param.getUserHasAuth();
		this.userCollege = param.getUserCollege();
		this.userSessionkey = param.getUserSessionkey();
		this.userSessionlimit = param.getUserSessionlimit();
		this.userRegdate = param.getUserRegdate();
	}

	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userPwCheck=" + userPwCheck + ", userNick="
				+ userNick + ", userName=" + userName + ", userSerial=" + userSerial + ", userEmail=" + userEmail
				+ ", userAuth=" + userAuth + ", userPhone=" + userPhone + ", userSex=" + userSex + ", userHasAuth="
				+ userHasAuth + ", userCollege=" + userCollege + ", userSessionkey=" + userSessionkey
				+ ", userSessionlimit=" + userSessionlimit + ", userRegdate=" + userRegdate + "]";
	}

}
