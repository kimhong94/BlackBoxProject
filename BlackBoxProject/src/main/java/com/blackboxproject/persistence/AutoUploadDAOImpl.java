package com.blackboxproject.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.blackboxproject.domain.CourseVO;


@Repository
public class AutoUploadDAOImpl implements AutoUploadDAO {

	
	@Inject
	private SqlSession session;

	private static final String namespace = "com.blackboxproject.mapper.AutoUploadMapper";

	@Override
	public CourseVO getFileName(String courseTime, String courseClassroom) throws Exception {
		Map<String, String> paramMap = new HashMap<String, String>();

		paramMap.put("courseTime", courseTime);
		paramMap.put("courseClassroom", courseClassroom);
		
		
		CourseVO vo = session.selectOne(namespace + ".getFileName", paramMap);
		return vo;
	}

}
