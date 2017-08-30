package com.blackboxproject.controller;

import java.util.List;


import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blackboxproject.domain.PostVO;
import com.blackboxproject.service.PostService;


@Controller
public class PostController {

	
	@Inject
	private PostService postService;
	
	
	@ResponseBody
	@RequestMapping(value="/courses/{c_id}/board/{b_id}/posts" , method=RequestMethod.GET)
	public ResponseEntity<List<PostVO>> getPosts(@PathVariable("c_id")int courseId,@PathVariable("b_id")int boardId){
		
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
	public ResponseEntity<String> readPost(@PathVariable("postId")int postId){
		
		ResponseEntity<String> entity = null;
		
		// 1. 권한 인증
		
		// 2. 하나의 게시글 정보 가져오기
		
		
		try {
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		
		return entity; 
	}
	
	@RequestMapping(value="/posts" , method=RequestMethod.POST)
	public ResponseEntity<String> createPost(@RequestBody PostVO vo){
		
		ResponseEntity<String> entity = null;
		
		// 1. 권한인증, 
		
		// 2. post정보 받아서 db에 입력
		try {
			postService.createPost(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
