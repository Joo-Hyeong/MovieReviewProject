package utill;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import VO.QABoardVO;
import criTest.Criteria;
import criTest.SearchCriteria;
import lombok.extern.log4j.Log4j;

// ** Board CRUD
// => selectList, selectOne, insert, update, delete 

@Log4j
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
	//----------------------------------------------------- 
	
	// PageList2. => ver01 : criPageList ------------------------
	public int totalRowsCount() {
		return sqlSession.selectOne(NS+"totalRowCount");
	} //totalRowsCount
	
	public List<QABoardVO> criPList(Criteria cri) {
		return sqlSession.selectList(NS+"pageList",cri);
	} //criPList
	//---------------------------------------------------
	
	
	// ** 답글등록
	public int replyInsert(QABoardVO vo) {
		log.info("** Step_Update Count => "+sqlSession.update(NS+"stepUpdate",vo));
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
