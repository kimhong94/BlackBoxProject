package com.blackboxproject.dto;

public class LoginDTO {

	// 회원 아이디
	private String userId;

	// 회원 비밀번호
	private String userPw;

	// 아이디, 비번 쿠키사용 여부
	private boolean useCookie;

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

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

	@Override
	public String toString() {
		return "LoginDTO [userId=" + userId + ", userPw=" + userPw + ", useCookie=" + useCookie + "]";
	}

}
