package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import utill.MemberDAO;
import VO.MemberVO;

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
	public int delete(MemberVO vo) {
		return dao.delete(vo);
	}
}
