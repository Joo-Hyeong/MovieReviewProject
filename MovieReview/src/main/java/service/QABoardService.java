package service;

import java.util.List;

import VO.QABoardVO;
import criForBoard.SearchCriteria;

public interface QABoardService {
	
	// PageList2. => ver02 : SearchPageList
	public int searchRowsCount(SearchCriteria cri);
	public List<QABoardVO> searchList(SearchCriteria cri);
	
	
	public int searchNewRowsCount(SearchCriteria cri);
	public List<QABoardVO> searchNewList(SearchCriteria cri);
	
	public List<QABoardVO> myQAList(QABoardVO vo);
	public List<QABoardVO> myQAList2(QABoardVO vo);
	
	int replyInsert(QABoardVO vo); // 답글등록

	List<QABoardVO> selectList(); //selectList
	QABoardVO selectOne(QABoardVO vo); //selectList

	// ** 조회수 증가
	int countUp(QABoardVO vo); //countUp

	int insert(QABoardVO vo); //insert
	int update(QABoardVO vo); //update
	int delete(QABoardVO vo); //delete
	int updateNtoY(QABoardVO vo);

}