package utill;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import VO.RatingVO;


@Repository
public class RatingDAO {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NS="green.mapper.RatingMapper.";
	
	

	public int ratingAverage(RatingVO vo) {
		return sqlSession.selectOne(NS+"ratingAverage", vo);
	}
	
	public int searchRowsCount(criForRating.SearchCriteria cri) {
		return sqlSession.selectOne(NS+"searchRowsCount",cri);
	}
	
	public List<RatingVO> searchList(criForRating.SearchCriteria cri) {
		return sqlSession.selectList(NS+"searchList",cri);
	}
	
	public int insert(RatingVO vo){
		return sqlSession.insert(NS+"insert", vo);
	}
	
	public int delete(RatingVO vo){
		return sqlSession.delete(NS+"delete", vo);
	}
	
}// RatingDAO
