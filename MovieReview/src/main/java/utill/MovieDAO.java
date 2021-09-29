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
	

	public MovieVO findMovieNum(MovieVO vo) {
		return sqlSession.selectOne(NS+"findMovieNum",vo);
	}
	
	public List<MovieVO> searchList(criForSearch.SearchCriteria cri){
		return sqlSession.selectList(NS+"searchList",cri);
	}
	
	public int searchRowsCount(criForSearch.SearchCriteria cri) {
		return sqlSession.selectOne(NS+"searchRowsCount",cri);
	}
	
	public List<MovieVO> selectList(){
	
	return sqlSession.selectList(NS+"selectList");
	}// selectList	
	
/* ================ << pageRows >> ======================= */
	
	public int pageRowsCountNew(criForMovie.Criteria cri) {
		return sqlSession.selectOne(NS+"pageRowsCountNew", cri);
	}
	public int pageRowsCountRandom(criForMovie.Criteria cri) {
		return sqlSession.selectOne(NS+"pageRowsCountRandom", cri);
	}	
	public int pageRowsCountRate(criForMovie.Criteria cri) {
		return sqlSession.selectOne(NS+"pageRowsCountRate", cri);
	}	
	
	
/* ================ << pageLists >> ======================= */
	
	public List<MovieVO> pageListNew(criForMovie.Criteria cri){
		
		return sqlSession.selectList(NS+"pageListNew",cri);
	}// selectListNew	
	
	public List<MovieVO> pageListRandom(criForMovie.Criteria cri){
		
	return sqlSession.selectList(NS+"pageListRandom",cri);
	}// selectListRandom
	
	public List<MovieVO> pageListRate(criForMovie.Criteria cri){
		
	return sqlSession.selectList(NS+"pageListRate",cri);
	}// selectListRate		
	
/* ================ << selectLists >> ===================== */
	public List<MovieVO> selectListNew(){
		
		return sqlSession.selectList(NS+"selectListNew");
	}// selectListNew	
	
	public List<MovieVO> selectListRandom(){
		
	return sqlSession.selectList(NS+"selectListRandom");
	}// selectListRandom
	
	public List<MovieVO> selectListRate(){
		
	return sqlSession.selectList(NS+"selectListRate");
	}// selectListRate	
	
/* ======================================================== */

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