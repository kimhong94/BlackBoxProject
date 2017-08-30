package com.blackboxproject.domain;

//회원 권한 확인 
public class AuthVO {

	private String userSerial;
	private String userSerialPw;

	public String getUserSerial() {
		return userSerial;
	}

	public void setUserSerial(String userSerial) {
		this.userSerial = userSerial;
	}

	public String getUserSerialPw() {
		return userSerialPw;
	}

	public void setUserSerialPw(String userSerialPw) {
		this.userSerialPw = userSerialPw;
	}

}