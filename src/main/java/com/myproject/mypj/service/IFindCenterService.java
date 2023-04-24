package com.myproject.mypj.service;

import java.util.List;

import com.myproject.mypj.vo.FindCenter_dto;

public interface IFindCenterService {

	
	public List<FindCenter_dto> findCenter(String address);
	
	public List<FindCenter_dto> findCenter2(String address);
	
}
