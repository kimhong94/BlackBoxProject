package com.blackboxproject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.blackboxproject.domain.PostVO;
import com.blackboxproject.persistence.PostDAO;

@Service
public class PostServiceImpl implements PostService {

	@Inject
	PostDAO postDao;

	@Override
	public List<PostVO> getPosts(int courseId, int boardId) throws Exception {
		return postDao.getPosts(courseId, boardId);
	}

	@Override
	public void createPost(PostVO vo) throws Exception {
		// 1. 글작성
		postDao.createPost(vo);

		// 2. 파일첨부

	}

}
