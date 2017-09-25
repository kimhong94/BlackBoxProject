package com.blackboxproject.service;

import java.util.List;

import com.blackboxproject.domain.CommentVO;

public interface CommentService {
	public void addReply(CommentVO vo) throws Exception;

	public void modifyReply(CommentVO vo) throws Exception;

	public void removeReply(int commentId) throws Exception;

	public List<CommentVO> listReplyPage(Integer postId) throws Exception;

	public List<CommentVO> getRecentComment(String userNick) throws Exception;

	public int count(Integer postId) throws Exception;

	public int getSeq() throws Exception;

	public void addReReply(CommentVO vo) throws Exception;

	public void replyShape(CommentVO vo) throws Exception;

	public void setGroupId(CommentVO vo) throws Exception;
}
