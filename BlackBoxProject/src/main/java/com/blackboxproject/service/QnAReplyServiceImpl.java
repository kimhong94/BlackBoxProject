package com.blackboxproject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.blackboxproject.domain.Criteria;
import com.blackboxproject.domain.QnAReplyVO;
import com.blackboxproject.persistence.QnAReplyDAO;

@Service
public class QnAReplyServiceImpl implements QnAReplyService {

	
	@Inject
	private QnAReplyDAO dao;
	
	@Override
	public void addReply(QnAReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.create(vo);
	}
	
	@Override
	public void addReReply(QnAReplyVO vo) throws Exception{
		dao.recreate(vo);
	}
	
	public void replyShape(QnAReplyVO vo) throws Exception{
		dao.reshape(vo);
	}

	@Override
	public void modifyReply(QnAReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void removeReply(int qnaCommentId) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(qnaCommentId);
	}

	@Override
	public List<QnAReplyVO> listReplyPage(Integer qnaPostId, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(qnaPostId, cri);
	}

	@Override
	public int count(Integer qnaPostId) throws Exception {
		// TODO Auto-generated method stub
		return dao.count(qnaPostId);
	}
	
	public int getSeq() throws Exception{
		return dao.getSeq();
		
	}

}
