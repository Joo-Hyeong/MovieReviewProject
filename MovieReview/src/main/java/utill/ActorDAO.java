package utill;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import VO.ActorVO;
import VO.PageVO;


@Repository
public class ActorDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NS = "green.mapper.ActorMapper.";
	
	// ** pageList
	public PageVO<ActorVO> pageList(PageVO<ActorVO> pvo) {
		// => 전체Row수(totalRowCount)
		pvo.setTotalRowCount(sqlSession.selectOne(NS+"totalRowCount"));
		// => 출력 Data 
		pvo.setList(sqlSession.selectList(NS+"pageList", pvo));
		return pvo;
	} //pageList

	
	public List<ActorVO> selectList(){
	
	return sqlSession.selectList(NS+"selectList");
	}// selectList	
	

	public List<ActorVO> selectOne(ActorVO vo) {
		return sqlSession.selectList(NS+"selectOne",vo);
	}//selectone
	
	// insert
	public int insert(ActorVO vo) {
		return sqlSession.insert(NS+"insert", vo);
	}// insert
	
	// update
	public int update(ActorVO vo) {
	
		return sqlSession.update(NS+"update", vo);
	}//update 종료
	
	// delete
	public int delete(ActorVO vo) {
		
		return sqlSession.delete(NS+"delete", vo);
	}//delete 종료

	
}// dao 종료