package service;

import java.util.List;

import VO.MemberVO;
import criForMember.SearchCriteria;


public interface MemberService {

	List<MemberVO> selectList();
	
	MemberVO authRequest(MemberVO vo);

	MemberVO selectOne(MemberVO vo);
	
	MemberVO searchNickname(MemberVO vo);
	
	int insert(MemberVO vo);

	int update(MemberVO vo);
	
	int updateExceptPassword(MemberVO vo);
	
	int delete(MemberVO vo);

	List<MemberVO> searchList(SearchCriteria cri);
	
	public int searchRowsCount(SearchCriteria cri);
}