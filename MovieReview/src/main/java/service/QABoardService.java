package service;

import java.util.List;

import VO.QABoardVO;
import criTest.Criteria;
import criTest.SearchCriteria;

public interface QABoardService {
	
	// PageList2. => ver02 : SearchPageList
	public int searchRowsCount(SearchCriteria cri);
	public List<QABoardVO> searchList(SearchCriteria cri);
	
	// PageList2. => ver01 : criPageList
	public int totalRowsCount();
	public List<QABoardVO> criPList(Criteria cri);
	
	int replyInsert(QABoardVO vo); // 답글등록

	List<QABoardVO> selectList(); //selectList
	QABoardVO selectOne(QABoardVO vo); //selectList

	// ** 조회수 증가
	int countUp(QABoardVO vo); //countUp

	int insert(QABoardVO vo); //insert
	int update(QABoardVO vo); //update
	int delete(QABoardVO vo); //delete

}