package service;

import java.util.List;

import VO.MovieVO;

public interface MovieService {


	List<MovieVO> selectList(); //selectList()

	MovieVO selectOne(MovieVO vo); //selectOne

	int insert(MovieVO vo); //insert

	int update(MovieVO vo); //update

	int delete(MovieVO vo); //delete

}