package com.blackboxproject.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blackboxproject.domain.CourseVO;
import com.blackboxproject.service.CourseService;

@Controller
public class CourseController {
	
	@Inject
	CourseService cs;
	
	// 나의 강의목록 페이지
//	@RequestMapping("/courses")
//	public void listCourses(){
//		
//		// 1. 권한인증하기
//		
//		// 2. 
//		
//	}
	
	
	
	// 강의페이지
	@RequestMapping(value="/courses/{courseId}", method=RequestMethod.GET)
	public String coursePage(@PathVariable("courseId")int courseId, Model model) throws Exception{
		
		// 1. 권한 인증
		
		// 2. 강의 정보 가져오기
		CourseVO vo = cs.getCourseInfo(courseId);
		model.addAttribute("course", vo);
		System.out.println("coursePage : " + vo);
		
		
		// 3. 강의회차 정보 가져와서 전달
		
		return "/coursePage";
	}
}
