package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import VO.RatingVO;
import criForRating.SearchCriteria;
import utill.RatingDAO;

@Service
public class RatingServiceImpl implements RatingService {

	@Autowired
	RatingDAO dao;
	
	
	@Override
	public int ratingAverage(RatingVO vo) {
		
		return dao.ratingAverage(vo);
	}
	
	@Override
	public List<RatingVO> searchList(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return dao.searchList(cri);
	}

	@Override
	public int searchRowsCount(SearchCriteria cri) {
		
		return dao.searchRowsCount(cri);
	}

	@Override
	public int insert(RatingVO vo) {
		return dao.insert(vo); 
	}
	
	@Override
	public int delete(RatingVO vo) {
		// TODO Auto-generated method stub
		return dao.delete(vo);
	}
	
}
