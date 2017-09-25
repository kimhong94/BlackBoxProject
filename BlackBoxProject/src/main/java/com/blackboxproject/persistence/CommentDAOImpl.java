package com.blackboxproject.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.blackboxproject.domain.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.blackboxproject.mapper.CommentMapper";

	@Override
	public void create(CommentVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".create", vo);
	}

	@Override
	public void recreate(CommentVO vo) throws Exception {
		session.insert(namespace + ".createRe", vo);
	}

	@Override
	public void update(CommentVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int commentId) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delete", commentId);
	}

	@Override
	public List<CommentVO> listPage(Integer postId) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listPage", postId);
	}

	@Override
	public int count(Integer postId) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".count", postId);
	}

	public int getSeq() throws Exception {
		return session.selectOne(namespace + ".getSeq");
	}

	public void reshape(CommentVO vo) throws Exception {
		session.update(namespace + ".reShape", vo);
	}

	public int getPostId(Integer commentId) throws Exception {
		return session.selectOne(namespace + ".getPostId", commentId);
	}

	@Override
	public void setGId(CommentVO vo) throws Exception {
		System.out.println(vo);
		session.update(namespace+".setCommentGroupId", vo);
	}

	@Override
	public List<CommentVO> getRecentComment(String userNick) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getRecentComment", userNick);
	}

}
