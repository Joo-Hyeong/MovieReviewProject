package utill;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import VO.MovieVO;

@Repository
public class MovieDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NS = "green.mapper.MovieMapper.";
	

	
	public List<MovieVO> selectList(){
	
	return sqlSession.selectList(NS+"selectList");
	}// selectList	
	

	public MovieVO selectOne(MovieVO vo) {
		return sqlSession.selectOne(NS+"selectOne",vo);
	}//selectone
	
	// insert
	public int insert(MovieVO vo) {
		return sqlSession.insert(NS+"insert", vo);
	}// insert
	
	// update
	public int update(MovieVO vo) {
	
		return sqlSession.update(NS+"update", vo);
	}//update 종료
	
	// delete
	public int delete(MovieVO vo) {
		
		return sqlSession.delete(NS+"delete", vo);
	}//delete 종료

	
}// dao 종료