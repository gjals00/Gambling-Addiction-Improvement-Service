package com.myproject.mypj.dao;

import java.util.List;

import com.myproject.mypj.vo.FindCenter_dto;

public interface IFindCenter_dao {
	
	
	public List<FindCenter_dto> findCenter(String ADDRESS);

	public List<FindCenter_dto> findCenter2(String ADDRESS);
}
