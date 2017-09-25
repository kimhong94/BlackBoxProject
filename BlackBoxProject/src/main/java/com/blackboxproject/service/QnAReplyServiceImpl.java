package com.blackboxproject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blackboxproject.domain.Criteria;
import com.blackboxproject.domain.QnAReplyVO;
import com.blackboxproject.persistence.QnABoardDAO;
import com.blackboxproject.persistence.QnAReplyDAO;

@Service
public class QnAReplyServiceImpl implements QnAReplyService {

	@Inject
	private QnAReplyDAO replyDAO;

	@Inject
	private QnABoardDAO boardDAO;

	@Transactional
	@Override
	public void addReply(QnAReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		replyDAO.create(vo);
		boardDAO.updateReplyCnt(vo.getQnaPostId(), 1);
	}

	@Transactional
	@Override
	public void addReReply(QnAReplyVO vo) throws Exception {
		replyDAO.recreate(vo);
		boardDAO.updateReplyCnt(vo.getQnaPostId(), 1);
	}

	public void replyShape(QnAReplyVO vo) throws Exception {
		replyDAO.reshape(vo);
	}

	@Override
	public void modifyReply(QnAReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		replyDAO.update(vo);
	}

	@Transactional
	@Override
	public void removeReply(int qnaCommentId) throws Exception {
		// TODO Auto-generated method stub
		int qnapostid = replyDAO.getQnaPostId(qnaCommentId);
		replyDAO.delete(qnaCommentId);
		boardDAO.updateReplyCnt(qnapostid, -1);
	}

	@Override
	public List<QnAReplyVO> listReplyPage(Integer qnaPostId, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.listPage(qnaPostId, cri);
	}

	@Override
	public int count(Integer qnaPostId) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.count(qnaPostId);
	}

	public int getSeq() throws Exception {
		return replyDAO.getSeq();

	}

	@Override
	public void setGroupId(QnAReplyVO vo) throws Exception {
		replyDAO.setGId(vo);
		
	}
	

	@Override
	public List<QnAReplyVO> getRecentComment(String userNick) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.getRecentComment(userNick);
	}

}
