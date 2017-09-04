package com.blackboxproject.dto;

public class CertifyDTO {
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

	@Override
	public String toString() {
		return "CertifyDTO [userSerial=" + userSerial + ", userSerialPw=" + userSerialPw + "]";
	}
	
	
}
