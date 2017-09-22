package com.blackboxproject.service;

import com.blackboxproject.domain.CourseVO;

public interface AutoUploadService {
	public CourseVO getFileName(String courseTime, String courseClassroom) throws Exception;
}
