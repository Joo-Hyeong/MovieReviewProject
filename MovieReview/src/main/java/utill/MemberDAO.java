package utill;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import VO.MemberVO;



@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NS = "green.mapper.MemberMapper.";
	
	public List<MemberVO> searchList(criForMember.SearchCriteria cri){
		return sqlSession.selectList(NS+"searchList",cri);
	}
	
	public int searchRowsCount(criForMember.SearchCriteria cri) {
		return sqlSession.selectOne(NS+"searchRowsCount",cri);
	}
	
	
	public MemberVO searchNickname(MemberVO vo) {
		return sqlSession.selectOne(NS+"searchNickname",vo);
	}//selectone
	
	public List<MemberVO> selectList(){
	
	return sqlSession.selectList(NS+"selectList");
	}// selectList	
	
	public MemberVO authRequest(MemberVO vo) {
		return sqlSession.selectOne(NS+"authRequest",vo);
	}//authRequest
	
	public MemberVO selectOne(MemberVO vo) {
		return sqlSession.selectOne(NS+"selectOne",vo);
	}//selectone
	
	// insert
	public int insert(MemberVO vo){
		return sqlSession.insert(NS+"insert", vo);
	}// insert
//	
	// update
	public int update(MemberVO vo) {
	
		return sqlSession.update(NS+"update", vo);
	}//update 종료
	
	
	// updateExceptPassword
	public int updateExceptPassword(MemberVO vo) {
		
			return sqlSession.update(NS+"updateExceptPassword", vo);
	}//updateExceptPassword 종료
	
	
	// delete
	public int delete(MemberVO vo) {
		
		return sqlSession.delete(NS+"delete", vo);
	}//delete 종료
//
//	
}// dao 종료