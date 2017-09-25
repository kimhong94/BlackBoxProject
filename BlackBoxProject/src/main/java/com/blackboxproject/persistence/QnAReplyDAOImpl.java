package com.blackboxproject.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.blackboxproject.domain.Criteria;
import com.blackboxproject.domain.QnAReplyVO;

@Repository
public class QnAReplyDAOImpl implements QnAReplyDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.blackboxproject.mapper.QnAReplyMapper";

	@Override
	public void create(QnAReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".create", vo);
	}

	@Override
	public void recreate(QnAReplyVO vo) throws Exception {
		session.insert(namespace + ".createRe", vo);
	}

	@Override
	public void update(QnAReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int qnaCommentId) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delete", qnaCommentId);
	}

	@Override
	public List<QnAReplyVO> listPage(Integer qnaPostId, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("qnaPostId", qnaPostId);
		paramMap.put("cri", cri);

		return session.selectList(namespace + ".listPage", paramMap);
	}

	@Override
	public int count(Integer qnaPostId) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".count", qnaPostId);
	}

	public int getSeq() throws Exception {
		return session.selectOne(namespace + ".getSeq");
	}

	public void reshape(QnAReplyVO vo) throws Exception {
		session.update(namespace + ".reShape", vo);
	}

	public int getQnaPostId(Integer qnaCommentId) throws Exception {
		return session.selectOne(namespace + ".getQnaPostId", qnaCommentId);
	}

	@Override
	public void setGId(QnAReplyVO vo) throws Exception {
		System.out.println(vo);
		session.update(namespace+".setCommentGroupId", vo);
	}
	
	@Override
	public List<QnAReplyVO> getRecentComment(String userNick) throws Exception {
		return session.selectList(namespace+".getRecentComment", userNick);
	}
}
