package com.blackboxproject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blackboxproject.domain.CommentVO;
import com.blackboxproject.persistence.CommentDAO;
import com.blackboxproject.persistence.PostDAO;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Inject
	private CommentDAO commentDAO;

	@Inject
	private PostDAO postDAO;

	@Transactional
	@Override
	public void addReply(CommentVO vo) throws Exception {
		// TODO Auto-generated method stub
		commentDAO.create(vo);
		postDAO.updateReplyCnt(vo.getPostId(), 1);
	}

	@Transactional
	@Override
	public void addReReply(CommentVO vo) throws Exception {
		commentDAO.recreate(vo);
		postDAO.updateReplyCnt(vo.getPostId(), 1);
	}

	public void replyShape(CommentVO vo) throws Exception {
		commentDAO.reshape(vo);
	}

	@Override
	public void modifyReply(CommentVO vo) throws Exception {
		// TODO Auto-generated method stub
		commentDAO.update(vo);
	}

	@Transactional
	@Override
	public void removeReply(int commentId) throws Exception {
		// TODO Auto-generated method stub
		int postid = commentDAO.getPostId(commentId);
		commentDAO.delete(commentId);
		postDAO.updateReplyCnt(postid, -1);
	}

	@Override
	public List<CommentVO> listReplyPage(Integer postId) throws Exception {
		// TODO Auto-generated method stub
		return commentDAO.listPage(postId);
	}

	@Override
	public int count(Integer postId) throws Exception {
		// TODO Auto-generated method stub
		return commentDAO.count(postId);
	}

	public int getSeq() throws Exception {
		return commentDAO.getSeq();

	}

	@Override
	public void setGroupId(CommentVO vo) throws Exception {
		commentDAO.setGId(vo);
		
	}

	@Override
	public List<CommentVO> getRecentComment(String userNick) throws Exception {
		// TODO Auto-generated method stub
		return commentDAO.getRecentComment(userNick);
	}

}
