package com.blackboxproject.persistence;

import java.util.List;

import com.blackboxproject.domain.Criteria;
import com.blackboxproject.domain.QnAReplyVO;

public interface QnAReplyDAO {

	public void create(QnAReplyVO vo) throws Exception;

	public void update(QnAReplyVO vo) throws Exception;

	public void delete(int qnaCommentId) throws Exception;

	public List<QnAReplyVO> listPage(Integer qnaPostId, Criteria cri) throws Exception;

	public int count(Integer qnaPostId) throws Exception;

	public int getSeq() throws Exception;

	public void recreate(QnAReplyVO vo) throws Exception;

	public void reshape(QnAReplyVO vo) throws Exception;

	public int getQnaPostId(Integer qnaCommentId) throws Exception;
	
	public void setGId(QnAReplyVO vo) throws Exception;
}
