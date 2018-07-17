package DAO;

import VO.Shopmember;

public interface ShopmemberMapper {

	public int insertMember(Shopmember vo);
	public Shopmember findMember(Shopmember vo);
	public Shopmember idCheck(String userid); 
}
