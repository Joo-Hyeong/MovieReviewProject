package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import utill.MemberDAO;
import VO.MemberVO;
import criForMember.SearchCriteria;

@Service
public class MemberServiceimpl implements MemberService {
	
	@Autowired
	MemberDAO dao;

	@Override
	public List<MemberVO> selectList() {
		return dao.selectList();
	}
	
	@Override
	public MemberVO searchNickname(MemberVO vo) {
		return dao.searchNickname(vo);
	}
	
	@Override
	public MemberVO authRequest(MemberVO vo) {
		return dao.authRequest(vo);
	}
	
	@Override
	public MemberVO selectOne(MemberVO vo) {
		return dao.selectOne(vo); 
	}
	
	@Override
	public int insert(MemberVO vo) {
		return dao.insert(vo); 
	}
	
	@Override
	public int update(MemberVO vo) {
		return dao.update(vo);
	}
	
	@Override
	public int updateExceptPassword(MemberVO vo) {
		return dao.updateExceptPassword(vo);
	}
		
	@Override
	public int delete(MemberVO vo) {
		return dao.delete(vo);
	}
	
	@Override
	public List<MemberVO> searchList(SearchCriteria cri) {
		return dao.searchList(cri);
	}

	@Override
	public int searchRowsCount(SearchCriteria cri) {
		return dao.searchRowsCount(cri);
	}
}
