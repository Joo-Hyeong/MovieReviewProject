package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import utill.MovieDAO;
import VO.MovieVO;
import criForMovie.Criteria;
import criForSearch.SearchCriteria;

//** interface 자동완성 
//=> Alt + Shift + T  
//=> 또는 마우스우클릭 PopUp Menu 의  Refactor - Extract Interface...

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	MovieDAO dao ;
	
	@Override
	public MovieVO findMovieNum(MovieVO vo) {
		return dao.findMovieNum(vo);
	}
	
	@Override
	public List<MovieVO> selectList() {
		return dao.selectList();
	} //selectList()
	
	@Override
	public int pageRowsCountNew(Criteria cri) {
		return dao.pageRowsCountNew(cri);
	}
	
	@Override
	public int pageRowsCountRandom(Criteria cri) {
		return dao.pageRowsCountRandom(cri);
	}
	
	@Override
	public int pageRowsCountRate(Criteria cri) {
		return dao.pageRowsCountRate(cri);
	}
	
	@Override
	public List<MovieVO> pageListNew(Criteria cri) {
		return dao.pageListNew(cri);
	}
	
	@Override
	public List<MovieVO> pageListRandom(Criteria cri) {
		return dao.pageListRandom(cri);
	}
	
	@Override
	public List<MovieVO> pageListRate(Criteria cri) {
		return dao.pageListRate(cri);
	}

	@Override
	public List<MovieVO> selectListNew() {
		return dao.selectListNew();
	} 
	
	@Override
	public List<MovieVO> selectListRandom() {
		return dao.selectListRandom();
	} //selectListRandom()
	
	@Override
	public List<MovieVO> selectListRate() {
		return dao.selectListRate();
	} //selectListRate()
	
	@Override
	public MovieVO selectOne(MovieVO vo) {
		return dao.selectOne(vo);
	} //selectOne
	
	@Override
	public int insert(MovieVO vo) {
		return dao.insert(vo);
	} //insert
	@Override
	public int update(MovieVO vo) {
		return dao.update(vo);
	} //update
	@Override
	public int delete(MovieVO vo) {
		return dao.delete(vo);
	} //delete
	
	@Override
	public List<MovieVO> searchList(SearchCriteria cri) {	
		return dao.searchList(cri);
	}
	@Override
	public int searchRowsCount(SearchCriteria cri) {
		return dao.searchRowsCount(cri);
	}
} //class