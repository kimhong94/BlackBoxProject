package com.blackboxproject.service;

import java.util.List;

import com.blackboxproject.domain.QnABoardVO;
import com.blackboxproject.domain.SearchCriteria;

public interface QnABoardService {
	public void regist(QnABoardVO vo) throws Exception;

	public QnABoardVO read(Integer qnaPostId) throws Exception;

	public void modify(QnABoardVO vo) throws Exception;

	public void remove(Integer qnaPostId) throws Exception;

	public List<QnABoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

}
