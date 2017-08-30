package com.blackboxproject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.blackboxproject.domain.CourseVO;
import com.blackboxproject.persistence.CourseDAO;


@Service
public class CourseServiceImpl implements CourseService {

	
	@Inject
	CourseDAO coursedao;
	
	@Override
	public void registAllCourese(List<CourseVO> list) throws Exception {
		
		for(CourseVO vo : list){
			coursedao.registCourse(vo);
		}
	}
}
