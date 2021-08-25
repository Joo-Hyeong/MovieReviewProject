package utill;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import VO.MovieVO;
import VO.PageVO;


@Repository
public class MovieDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NS = "green.mapper.MovieMapper.";
	
	// ** pageList
	public PageVO<MovieVO> pageList(PageVO<MovieVO> pvo) {
		// => 전체Row수(totalRowCount)
		pvo.setTotalRowCount(sqlSession.selectOne(NS+"totalRowCount"));
		// => 출력 Data 
		pvo.setList(sqlSession.selectList(NS+"pageList", pvo));
		return pvo;
	} //pageList

	
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