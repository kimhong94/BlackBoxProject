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

import com.blackboxproject.domain.Criteria;
import com.blackboxproject.domain.PageMaker;
import com.blackboxproject.domain.QnAReplyVO;
import com.blackboxproject.service.QnAReplyService;

@RestController
@RequestMapping("/replies")
public class QnAReplyController {

	@Inject
	private QnAReplyService service;

	// 댓글 작성하기
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody QnAReplyVO vo) {

		ResponseEntity<String> entity = null;
		try {
			/*
			 * 1. 지금부터 스탭은 jsp에서 계산하지 않는다
			 * 2. controller에서 max(step)을 구한다.
			 * 3. 
			 * */
			int getSeq = service.getSeq();
			System.out.println(getSeq);
			vo.setQnaCommentGroupId(getSeq);
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 재 댓글 작성하기
	@RequestMapping(value = "/re", method = RequestMethod.POST)
	public ResponseEntity<String> reregister(@RequestBody QnAReplyVO vo) {

		ResponseEntity<String> entity = null;
		try {

			System.out.println(vo);
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
	@RequestMapping(value = "/{qnaCommentId}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("qnaCommentId") Integer qnaCommentId,
			@RequestBody QnAReplyVO vo) {

		ResponseEntity<String> entity = null;
		try {
			vo.setQnaCommentId(qnaCommentId);
			service.modifyReply(vo);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{qnaCommentId}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("qnaCommentId") Integer qnaCommentId) {
		ResponseEntity<String> entity = null;
		try {
			service.removeReply(qnaCommentId);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{qnaPostId}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("qnaPostId") int qnaPostId,
			@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Criteria cri = new Criteria();
			cri.setPage(page);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			Map<String, Object> map = new HashMap<String, Object>();
			List<QnAReplyVO> list = service.listReplyPage(qnaPostId, cri);
			map.put("list", list);

			int replyCount = service.count(qnaPostId);
			pageMaker.setTotalCount(replyCount);

			map.put("pageMaker", pageMaker);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;

	}
}
