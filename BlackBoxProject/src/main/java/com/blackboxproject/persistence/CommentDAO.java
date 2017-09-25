package com.blackboxproject.persistence;

import java.util.List;

import com.blackboxproject.domain.CommentVO;

public interface CommentDAO {
	public void create(CommentVO vo) throws Exception;

	public void update(CommentVO vo) throws Exception;

	public void delete(int commentId) throws Exception;

	public List<CommentVO> listPage(Integer postId) throws Exception;

	public List<CommentVO> getRecentComment(String userNick) throws Exception;

	public int count(Integer postId) throws Exception;

	public int getSeq() throws Exception;

	public void recreate(CommentVO vo) throws Exception;

	public void reshape(CommentVO vo) throws Exception;

	public int getPostId(Integer commentId) throws Exception;

	public void setGId(CommentVO vo) throws Exception;
}
