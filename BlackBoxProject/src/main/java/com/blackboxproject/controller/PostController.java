package com.blackboxproject.controller;

import java.io.File;
import java.util.Arrays;
import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blackboxproject.domain.FileVO;
import com.blackboxproject.domain.PostVO;
import com.blackboxproject.domain.UserVO;
import com.blackboxproject.service.PostService;


@Controller
public class PostController {

	
	@Inject
	private PostService postService;
	
	
	@ResponseBody
	@RequestMapping(value="/courses/{c_id}/board/{b_id}/posts" , method=RequestMethod.GET)
	public ResponseEntity<List<PostVO>> getPosts(@PathVariable("c_id")int courseId,@PathVariable("b_id")int boardId,
			HttpSession session){
		
		ResponseEntity<List<PostVO>> entity = null;
		
		// 1. 권한인증, 
		// 2. 해당 게시판 글가져오기
		try {
			entity = new ResponseEntity<>(postService.getPosts(courseId, boardId), HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/posts/{postId}" , method=RequestMethod.GET)
	public ResponseEntity<PostVO> readPost(@PathVariable("postId")int postId) throws Exception{
		
		ResponseEntity<PostVO> entity = null;
		// 1. 권한 인증
		
		// 2. 하나의 게시글 정보 가져오기
		PostVO pvo = postService.getPostByPostId(postId);
		
		// 3. 첨부 파일 정보 가져오기
		List<FileVO> files = postService.getFilesByPostId(postId);
		pvo.setFiles(files);
		// 4. 댓글 정보 가져오기
		
		try {
			entity = new ResponseEntity<>(pvo, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		
		return entity; 
	}
	
	@ResponseBody
	@RequestMapping(value="/posts/{postId}" , method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modifyPost(@PathVariable("postId")int postId,@RequestBody PostVO pvo) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		pvo.setPostId(postId);
		
		try {
			
			postService.modifyPost(pvo); 
			
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		
		return entity; 
	}
	
	@RequestMapping(value="/posts" , method=RequestMethod.POST)
	public ResponseEntity<String> createPost(@RequestBody PostVO vo) throws Exception{
		
		ResponseEntity<String> entity = null;
		System.out.println(vo.toString());
		// 1. 권한인증, 
		
		// 2. post정보 받아서 db에 입력, 
		// 3. post에 파일첨부 정보 db에 입력
		postService.createPost(vo);
		// 4. 트랜잭션처리

		try {
			//postService.createPost(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
