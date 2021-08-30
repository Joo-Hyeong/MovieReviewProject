package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import VO.QABoardVO;
import criTest.Criteria;
import criTest.SearchCriteria;
import utill.QABoardDAO;

//** interface 자동완성 
// => Alt + Shift + T  
// => 또는 마우스우클릭 PopUp Menu 의  Refactor - Extract Interface...

@Service
public class QABoardServiceImpl implements QABoardService {
	@Autowired
	QABoardDAO dao;
	
	
	// PageList2. => ver02 : SearchPageList--------------- 
	@Override
	public int searchRowsCount(SearchCriteria cri) {
		return dao.searchRowsCount(cri);
	}
	@Override
	public List<QABoardVO> searchList(SearchCriteria cri) {
		return dao.searchList(cri);
	}
	//----------------------------------------------------- 
	
	// PageList2. => ver01 : criPageList --------------------------
	@Override
	public int totalRowsCount() {
		return dao.totalRowsCount();
	} //totalRowsCount
	
	@Override
	public List<QABoardVO> criPList(Criteria cri) {
		return dao.criPList(cri);
	} //criPList
	//-------------------------------------------------------
	
	// 답글등록
	@Override
	public int replyInsert(QABoardVO vo) {
		return dao.replyInsert(vo);
	} //replyInsert
	
	@Override
	public List<QABoardVO> selectList() {
		return dao.selectList();
	} //selectList
	@Override
	public QABoardVO selectOne(QABoardVO vo) {
		return dao.selectOne(vo);
	} //selectList
	
	// ** 조회수 증가
	@Override
	public int countUp(QABoardVO vo) {
		return dao.countUp(vo);
	} //countUp
	
	@Override
	public int insert(QABoardVO vo) {
		return dao.insert(vo);
	} //insert
	@Override
	public int update(QABoardVO vo) {
		return dao.update(vo);
	} //update
	@Override
	public int delete(QABoardVO vo) {
		return dao.delete(vo);
	} //delete

} //class
