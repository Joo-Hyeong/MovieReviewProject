package utill;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import VO.WishVO;



@Repository
public class WishDAO {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NS="green.mapper.WishMapper.";
	
	public int searchRowsCount(criForWish.SearchCriteria cri) {
		return sqlSession.selectOne(NS+"searchRowsCount",cri);
	}
	
	public WishVO selectOne(WishVO vo) {
		return sqlSession.selectOne(NS+"selectOne",vo);
	}
	
	public List<WishVO> searchList(criForWish.SearchCriteria cri) {
		return sqlSession.selectList(NS+"searchList",cri);
	}
	
	public int insert(WishVO vo){
		return sqlSession.insert(NS+"insert", vo);
	}
	
	public int delete(WishVO vo){
		return sqlSession.delete(NS+"delete", vo);
	}
	
}// RatingDAO
