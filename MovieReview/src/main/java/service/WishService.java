package service;

import java.util.List;

import VO.WishVO;
import criForWish.SearchCriteria;

public interface WishService {

	List<WishVO> searchList(SearchCriteria cri);

	int searchRowsCount(SearchCriteria cri);
	
	WishVO selectOne(WishVO vo);

	int insert(WishVO vo);

	int delete(WishVO vo);

}