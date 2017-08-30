package com.blackboxproject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.blackboxproject.domain.QnABoardVO;
import com.blackboxproject.domain.SearchCriteria;
import com.blackboxproject.persistence.QnABoardDAO;

@Service
public class QnABoardServiceImpl implements QnABoardService {

	@Inject
	private QnABoardDAO dao;

	@Override
	public void regist(QnABoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.create(vo);
	}

	@Override
	public QnABoardVO read(Integer qnaPostId) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(qnaPostId);
	}

	@Override
	public void modify(QnABoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void remove(Integer qnaPostId) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(qnaPostId);
	}

	@Override
	public List<QnABoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {

		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return dao.listSearchCount(cri);
	}
}
