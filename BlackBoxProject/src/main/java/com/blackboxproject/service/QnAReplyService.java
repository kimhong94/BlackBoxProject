package com.blackboxproject.service;

import java.util.List;

import com.blackboxproject.domain.Criteria;
import com.blackboxproject.domain.QnAReplyVO;

public interface QnAReplyService {
	public void addReply(QnAReplyVO vo) throws Exception;

	public void modifyReply(QnAReplyVO vo) throws Exception;

	public void removeReply(int qnaCommentId) throws Exception;

	public List<QnAReplyVO> listReplyPage(Integer qnaPostId, Criteria cri) throws Exception;

	public int count(Integer qnaPostId) throws Exception;

	public int getSeq() throws Exception;

	public void addReReply(QnAReplyVO vo) throws Exception;
	
	public void replyShape(QnAReplyVO vo) throws Exception;
}
