package service;

import java.util.List;

import VO.ActorVO;
import VO.PageVO;

public interface ActorService {

	PageVO<ActorVO> pageList(PageVO<ActorVO> pvo);

	List<ActorVO> selectList(); //selectList()

	List<ActorVO> selectOne(ActorVO vo); //selectOne

	int insert(ActorVO vo); //insert

	int update(ActorVO vo); //update

	int delete(ActorVO vo); //delete

}