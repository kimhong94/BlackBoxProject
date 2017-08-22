package com.blackboxproject.persistence;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blackboxproject.domain.CourseVO;
import com.blackboxproject.service.CourseService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/**/*.xml"
})
public class CourseDAOTest {
	
	@Inject
	CourseDAO courseDao;

	
	@Inject
	CourseService courseService;
	
	@Test
	public void test() throws Exception {
		List<CourseVO> list = new LinkedList<>();
		
		for (int i = 0; i < 3; i++) {
			
			CourseVO vo = new CourseVO();
			vo.setCourseCode("abc" + i);
			vo.setCourseClass(1);
			vo.setCourseYear("2000" + i);
			vo.setCourseSemester("하" +i);
			vo.setCourseName("일반화학");
			vo.setCourseTime("월1수1");
			vo.setCourseDiv("aaaaa" + i);
			vo.setCourseDepartment("bbbbbbb" );
			vo.setCoursePhone("5135555");
			vo.setCourseCampus("ccccccc");
			vo.setCourseGrade("1~4");
			vo.setCourseProf("ddddddd");
			vo.setCourseClassroom("eeeeeeee");
			vo.setCourseCredit(3);
			
			list.add(vo);
		}
		
		courseService.registAllCourese(list);
	}

}
