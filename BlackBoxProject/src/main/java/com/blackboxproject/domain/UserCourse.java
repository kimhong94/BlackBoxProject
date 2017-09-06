package com.blackboxproject.domain;

public class UserCourse {
	private String userId;
	private Integer courseId;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}


	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	@Override
	public String toString() {
		return "UserCourse [userId=" + userId + ", courseId=" + courseId + "]";
	}
}
