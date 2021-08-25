package service;

import java.util.List;

import VO.MovieVO;
import VO.PageVO;

public interface MovieService {

	PageVO<MovieVO> pageList(PageVO<MovieVO> pvo);

	List<MovieVO> selectList(); //selectList()

	MovieVO selectOne(MovieVO vo); //selectOne

	int insert(MovieVO vo); //insert

	int update(MovieVO vo); //update

	int delete(MovieVO vo); //delete

}