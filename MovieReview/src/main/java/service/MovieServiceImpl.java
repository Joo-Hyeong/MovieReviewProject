package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import utill.MovieDAO;
import VO.MovieVO;

//** interface 자동완성 
//=> Alt + Shift + T  
//=> 또는 마우스우클릭 PopUp Menu 의  Refactor - Extract Interface...

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	MovieDAO dao ;
	
	
	@Override
	public List<MovieVO> selectList() {
		return dao.selectList();
	} //selectList()
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
} //class