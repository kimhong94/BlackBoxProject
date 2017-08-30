package com.blackboxproject.service;

import java.util.List;

import com.blackboxproject.domain.CourseVO;

public interface CourseService {
	
	public void registAllCourese(List<CourseVO> list) throws Exception;
	public CourseVO getCourseInfo(int courseId) throws Exception;
}
