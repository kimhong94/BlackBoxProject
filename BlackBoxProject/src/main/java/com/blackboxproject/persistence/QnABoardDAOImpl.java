package com.blackboxproject.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.blackboxproject.domain.QnABoardVO;
import com.blackboxproject.domain.SearchCriteria;

@Repository
public class QnABoardDAOImpl implements QnABoardDAO {
	@Inject
	private SqlSession session;

	private static String namespace = "com.blackboxproject.mapper.QnABoardMapper";

	@Override
	public void create(QnABoardVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public QnABoardVO read(Integer qnaPostId) throws Exception {

		return session.selectOne(namespace + ".read", qnaPostId);
	}

	@Override
	public void update(QnABoardVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer qnaPostId) throws Exception {
		session.delete(namespace + ".delete", qnaPostId);
	}

	@Override
	public List<QnABoardVO> listSearch(SearchCriteria cri) throws Exception {

		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return session.selectOne(namespace + ".listSearchCount", cri);
	}
}
