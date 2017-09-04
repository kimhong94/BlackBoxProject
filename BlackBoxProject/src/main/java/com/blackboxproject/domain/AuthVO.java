package com.blackboxproject.domain;

//회원 권한 확인 
//회원 권한 확인 
public class AuthVO {

	// 회원 권한
	private String userAuth;

	// 권한 이름
	private String authName;

	public String getUserAuth() {
		return userAuth;
	}

	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}

	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	// Auth 모델 복사
	public void CopyData(AuthVO param) {
		this.userAuth = param.getUserAuth();
		this.authName = param.getAuthName();
	}

	@Override
	public String toString() {
		return "AuthVO [userAuth=" + userAuth + ", authName=" + authName + "]";
	}

}