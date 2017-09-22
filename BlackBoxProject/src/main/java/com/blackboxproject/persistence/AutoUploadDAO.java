package com.blackboxproject.persistence;

import com.blackboxproject.domain.CourseVO;

public interface AutoUploadDAO {
	public CourseVO getFileName(String courseTime, String courseClassroom) throws Exception;
}
