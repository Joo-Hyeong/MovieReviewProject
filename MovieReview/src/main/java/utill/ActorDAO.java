package utill;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import VO.ActorVO;


@Repository
public class ActorDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NS = "green.mapper.ActorMapper.";
	

	
	public List<ActorVO> selectList(){
	
	return sqlSession.selectList(NS+"selectList");
	}// selectList	
	

	public List<ActorVO> selectListActs(ActorVO vo) {
		return sqlSession.selectList(NS+"selectListActs",vo);
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