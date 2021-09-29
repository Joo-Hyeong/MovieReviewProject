package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import VO.WishVO;
import criForWish.SearchCriteria;
import utill.WishDAO;

@Service
public class WishServiceImpl implements WishService {

	@Autowired
	WishDAO dao;
	
	@Override
	public WishVO selectOne(WishVO vo) {
		return dao.selectOne(vo);
	}
	
	
	@Override
	public List<WishVO> searchList(SearchCriteria cri) {
		return dao.searchList(cri);
	}

	@Override
	public int searchRowsCount(SearchCriteria cri) {
		return dao.searchRowsCount(cri);
	}

	@Override
	public int insert(WishVO vo) {
		return dao.insert(vo); 
	}
	
	@Override
	public int delete(WishVO vo) {
		return dao.delete(vo);
	}
	
}
