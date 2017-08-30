package com.blackboxproject.service;

import java.util.List;

import com.blackboxproject.domain.PostVO;

public interface PostService {

	public List<PostVO> getPosts(int courseId, int boardId) throws Exception;

	public void createPost(PostVO vo) throws Exception;
	
	
	
}
