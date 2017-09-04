package com.blackboxproject.persistence;

import java.util.List;

import com.blackboxproject.domain.QnABoardVO;
import com.blackboxproject.domain.SearchCriteria;

public interface QnABoardDAO {
	public void create(QnABoardVO vo) throws Exception;

	public QnABoardVO read(Integer qnaPostId) throws Exception;

	public void update(QnABoardVO vo) throws Exception;

	public void delete(Integer qnaPostId) throws Exception;

	public List<QnABoardVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void updateReplyCnt(Integer qnaPostId, int amount) throws Exception;

	public void updateViewCnt(Integer qnaPostId) throws Exception;
}
