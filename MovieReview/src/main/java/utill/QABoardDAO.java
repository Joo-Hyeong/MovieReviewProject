package utill;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import VO.QABoardVO;
import criForBoard.SearchCriteria;


// ** Board CRUD
// => selectList, selectOne, insert, update, delete 


@Repository
public class QABoardDAO {
	@Autowired
	SqlSession sqlSession;
	private static final String NS="green.mapper.QABoardMapper.";
	
	// PageList2. => ver02 : SearchPageList---------------
	// => mapper 에 searchRowsCount, searchList 추가
	public int searchRowsCount(SearchCriteria cri) {
		return sqlSession.selectOne(NS+"searchRowsCount",cri);
	}
	public List<QABoardVO> searchList(SearchCriteria cri) {
		return sqlSession.selectList(NS+"searchList",cri);
	}
	
	public int searchNewRowsCount(SearchCriteria cri) {
		return sqlSession.selectOne(NS+"searchNewRowsCount",cri);
	}
	
	
	public List<QABoardVO> searchNewList(SearchCriteria cri) {
		return sqlSession.selectList(NS+"searchNewList",cri);
	}
	//----------------------------------------------------- 
	public List<QABoardVO> myQAList(QABoardVO vo) {
		return sqlSession.selectList(NS+"myQAList",vo);
	}
	public List<QABoardVO> myQAList2(QABoardVO vo) {
		return sqlSession.selectList(NS+"myQAList2",vo);
	}
	
	public int updateNtoY(QABoardVO vo) {
		return sqlSession.update(NS+"updateNtoY",vo);
	} //update
	
	// ** 답글등록
	public int replyInsert(QABoardVO vo) {
		return sqlSession.insert(NS+"replyInsert",vo);
	} //replyInsert
	
	// ** selectList
	public List<QABoardVO> selectList() {
		return sqlSession.selectList(NS+"selectList");
	} //selectList
	
	// ** selectOne
	public QABoardVO selectOne(QABoardVO vo) {
		return sqlSession.selectOne(NS+"selectOne", vo);
	} //selectOne 
	
	// ** 조회수 증가
	public int countUp(QABoardVO vo) {
		return sqlSession.update(NS+"countUp",vo);
	} //countUp
	
	// ** insert (원글)
	public int insert(QABoardVO vo) {
		return sqlSession.insert(NS+"insert",vo);
	} //insert
	// ** update
	public int update(QABoardVO vo) {
		return sqlSession.update(NS+"update",vo);
	} //update
	// ** delete
	public int delete(QABoardVO vo) {
		return sqlSession.delete(NS+"delete",vo);
	} //delete
} //class
