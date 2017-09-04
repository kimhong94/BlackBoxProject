package com.blackboxproject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blackboxproject.domain.FileVO;
import com.blackboxproject.domain.PostVO;
import com.blackboxproject.persistence.PostDAO;

@Service
public class PostServiceImpl implements PostService {

	@Inject
	PostDAO postDao;
	
	@Override
	public List<PostVO> getPosts(int courseId, int boardId) throws Exception{
		return postDao.getPosts(courseId, boardId);
	}

	@Override
	@Transactional
	public void createPost(PostVO vo) throws Exception{
		// 1. 글작성
		postDao.createPost(vo);
		
		// 2. 파일첨부, createPost에서 postId값을 받아온다. mapper 참조
		List<FileVO> files = vo.getFiles();
		for(FileVO fvo : files){
			fvo.setPostId(vo.getPostId());
			postDao.addFile(fvo);
		}
		
		// 3. 트랜잭션 처리
	}

	@Override
	public PostVO getPostByPostId(int postId) throws Exception {

		return postDao.getPostByPostId(postId);
		
	}

	@Override
	public List<FileVO> getFilesByPostId(int postId) throws Exception {
		return postDao.getFilesByPostId(postId);
	}

}
