package com.blackboxproject.persistence;

import java.util.List;

import javax.inject.Inject;

import com.blackboxproject.domain.PostVO;


public interface PostDAO {
	
	public List<PostVO> getPosts(int courseId, int boardId) throws Exception;

	public void createPost(PostVO vo) throws Exception;
	
}
