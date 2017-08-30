package com.blackboxproject.persistence;

import java.util.List;
import java.util.Map;

import com.blackboxproject.domain.CourseVO;

public interface CourseDAO {
	
	public void registCourse(CourseVO vo) throws Exception;
	public CourseVO getCourseInfo(int courseId) throws Exception;
}
