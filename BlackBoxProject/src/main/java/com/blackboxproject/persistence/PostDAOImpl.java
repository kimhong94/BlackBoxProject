package com.blackboxproject.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.blackboxproject.domain.PostVO;

@Repository
public class PostDAOImpl implements PostDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.blackboxproject.mapper.PostMapper";
	
	@Override
	public List<PostVO> getPosts(int courseId, int boardId) throws Exception {
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("courseId", courseId);
		map.put("boardId", boardId);
		
		return session.selectList(namespace+".getPosts", map);
	}

	@Override
	public void createPost(PostVO vo) throws Exception {
		
		session.insert(namespace+".createPost", vo);
		
	}

}
