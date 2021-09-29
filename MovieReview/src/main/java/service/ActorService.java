package service;

import java.util.List;

import VO.ActorVO;

public interface ActorService {


	List<ActorVO> selectList(); //selectList()

	List<ActorVO> selectListActs(ActorVO vo); //selectOne

	int insert(ActorVO vo); //insert

	int update(ActorVO vo); //update

	int delete(ActorVO vo); //delete

}