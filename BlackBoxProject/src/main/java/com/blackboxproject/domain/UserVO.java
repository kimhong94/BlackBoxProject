package com.blackboxproject.domain;

import java.sql.Date;

//세션에 보관되는 것을 관리하는 클래스
//사용자 
public class UserVO {
	// 회원 아이디
	private String user_id;

	// 회원 비밀번호
	private String user_pw;

	// 회원 비밀번호 확인
	private String user_pw_check;

	// 회원 닉네임

	private String user_nick;

	// 회원 이름
	private String user_name;

	// 회원 학번
	private Integer user_serial;

	// 회원 이메일
	private String user_email;

	// 회원 권한
	private String user_auth;

	// 회원 전화번호
	private String user_phone;

	// 회원 성별
	private String user_sex;

	// 회원 인증 여부
	private Integer user_has_auth;

	// 회원 대학교
	private String user_college;

	// 회원 가입 날짜
	private Date user_regdate;

	// 회원 세션 키값
	private String user_sessionKey;

	// 회원 유효 세션 기간
	private Date user_sessionLimit;

	public Date getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}

	public String getUser_sessionKey() {
		return user_sessionKey;
	}

	public void setUser_sessionKey(String user_sessionKey) {
		this.user_sessionKey = user_sessionKey;
	}

	public Date getUser_sessionLimit() {
		return user_sessionLimit;
	}

	public void setUser_sessionLimit(Date user_sessionLimit) {
		this.user_sessionLimit = user_sessionLimit;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_pw_check() {
		return user_pw_check;
	}

	public void setUser_pw_check(String user_pw_check) {
		this.user_pw_check = user_pw_check;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Integer getUser_serial() {
		return user_serial;
	}

	public void setUser_serial(Integer user_serial) {
		this.user_serial = user_serial;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_auth() {
		return user_auth;
	}

	public void setUser_auth(String user_auth) {
		this.user_auth = user_auth;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public Integer getUser_has_auth() {
		return user_has_auth;
	}

	public void setUser_has_auth(Integer user_has_auth) {
		this.user_has_auth = user_has_auth;
	}

	public String getUser_college() {
		return user_college;
	}

	public void setUser_college(String user_college) {
		this.user_college = user_college;
	}

	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_nick=" + user_nick + ", user_name="
				+ user_name + ", user_serial=" + user_serial + ", user_email=" + user_email + ", user_auth=" + user_auth
				+ ", user_phone=" + user_phone + ", user_sex=" + user_sex + ", user_has_auth=" + user_has_auth
				+ ", user_college=" + user_college + "]";
	}
}
