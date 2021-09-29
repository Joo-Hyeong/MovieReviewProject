package service;

import java.util.List;

import VO.MovieVO;
import criForMovie.Criteria;
import criForSearch.SearchCriteria;

public interface MovieService {
	
	List<MovieVO> pageListRate(Criteria cri);
	List<MovieVO> pageListRandom(Criteria cri);
	List<MovieVO> pageListNew(Criteria cri);
	
	int pageRowsCountRate(Criteria cri);
	int pageRowsCountRandom(Criteria cri);
	int pageRowsCountNew(Criteria cri);
	
	List<MovieVO> selectListRate();
	List<MovieVO> selectListRandom();
	List<MovieVO> selectListNew();
	
	List<MovieVO> selectList(); //selectList()

	MovieVO selectOne(MovieVO vo); //selectOne

	MovieVO findMovieNum(MovieVO vo); //selectOne
	
	int insert(MovieVO vo); //insert

	int update(MovieVO vo); //update

	int delete(MovieVO vo); //delete

	List<MovieVO> searchList(SearchCriteria cri);
	
	public int searchRowsCount(SearchCriteria cri);
}