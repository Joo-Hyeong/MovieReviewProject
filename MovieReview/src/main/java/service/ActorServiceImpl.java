package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import utill.ActorDAO;
import VO.ActorVO;
import VO.PageVO;

//** interface 자동완성 
//=> Alt + Shift + T  
//=> 또는 마우스우클릭 PopUp Menu 의  Refactor - Extract Interface...

@Service
public class ActorServiceImpl implements ActorService {
	@Autowired
	ActorDAO dao ;
	
	@Override
	public PageVO<ActorVO> pageList(PageVO<ActorVO> pvo) {
		return dao.pageList(pvo);
	}
	
	@Override
	public List<ActorVO> selectList() {
		return dao.selectList();
	} //selectList()
	@Override
	public List<ActorVO> selectOne(ActorVO vo) {
		return dao.selectOne(vo);
	} //selectOne
	
	@Override
	public int insert(ActorVO vo) {
		return dao.insert(vo);
	} //insert
	@Override
	public int update(ActorVO vo) {
		return dao.update(vo);
	} //update
	@Override
	public int delete(ActorVO vo) {
		return dao.delete(vo);
	} //delete
} //class