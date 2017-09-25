package com.blackboxproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.blackboxproject.domain.CommentVO;
import com.blackboxproject.service.CommentService;

@RestController
@RequestMapping("/reply")
public class CommentController {

	@Inject
	private CommentService service;

	// 댓글 작성하기
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody CommentVO vo) {

		ResponseEntity<String> entity = null;
		try {
			service.addReply(vo);
			int getSeq = service.getSeq();
			vo.setCommentId(getSeq);
			vo.setCommentGroupId(getSeq);
			service.setGroupId(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 재 댓글 작성하기
	@RequestMapping(value = "/re", method = RequestMethod.POST)
	public ResponseEntity<String> reregister(@RequestBody CommentVO vo) {

		ResponseEntity<String> entity = null;
		try {
			service.replyShape(vo);
			service.addReReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 댓글 수정하기
	@RequestMapping(value = "/{commentId}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("commentId") Integer commentId, @RequestBody CommentVO vo) {

		ResponseEntity<String> entity = null;
		try {
			vo.setCommentId(commentId);
			service.modifyReply(vo);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 댓글 삭제하기
	@RequestMapping(value = "/{commentId}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("commentId") Integer commentId) {
		ResponseEntity<String> entity = null;
		try {
			service.removeReply(commentId);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 댓글들 보여주기
	@RequestMapping(value = "/{postId}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("postId") int postId) {
		ResponseEntity<Map<String, Object>> entity = null;

		try {

			Map<String, Object> map = new HashMap<String, Object>();
			List<CommentVO> list = service.listReplyPage(postId);
			map.put("list", list);

			int replyCount = service.count(postId);

			map.put("replyCount", replyCount);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

}
