package com.blackboxproject.persistence;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blackboxproject.domain.PostVO;
import com.blackboxproject.service.PostService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/**/*.xml"
})
public class PostDAOTest {

	@Inject
	public PostService ps;
	
	@Test
	public void createPostTest() throws Exception {
		
		PostVO vo = new PostVO();
		vo.setCourseId(4);
		vo.setPostContent("안녕하세요hahaha");
		vo.setPostTitle("test2");
		vo.setBoardId(1);
		vo.setUserNick("honghong");
		
		ps.createPost(vo);
		
	}

}
