package service;

import java.util.List;


import VO.RatingVO;
import criForRating.SearchCriteria;

public interface RatingService {
	public List<RatingVO> searchList(SearchCriteria cri);
	public int searchRowsCount(SearchCriteria cri);
	public int insert(RatingVO vo);
	public int delete(RatingVO vo);
	public int ratingAverage(RatingVO vo);
	
	
}
