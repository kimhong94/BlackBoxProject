package com.blackboxproject.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.blackboxproject.domain.CourseVO;
import com.blackboxproject.persistence.AutoUploadDAO;

@Service
public class AutoUploadServiceImpl implements AutoUploadService {

	@Inject
	AutoUploadDAO autouploaddao;

	
	@Override
	public CourseVO getFileName(String courseTime, String courseClassroom) throws Exception {
		
		return autouploaddao.getFileName(courseTime, courseClassroom);
	}

}
