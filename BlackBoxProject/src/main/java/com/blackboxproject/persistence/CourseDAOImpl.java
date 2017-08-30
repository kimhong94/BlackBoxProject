package com.blackboxproject.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.blackboxproject.domain.CourseVO;


@Repository
public class CourseDAOImpl implements CourseDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.blackboxproject.mapper.CourseMapper";

	@Override
	public void registCourse(CourseVO vo) throws Exception {
			session.insert(namespace+".registAllCourse" , vo);
	}

	@Override
	public CourseVO getCourseInfo(int courseId) throws Exception{
		CourseVO vo = session.selectOne(namespace+".getCourseInfo", courseId);
		return vo;
	}
}
