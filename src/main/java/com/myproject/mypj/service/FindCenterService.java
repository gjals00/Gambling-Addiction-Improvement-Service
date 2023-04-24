package com.myproject.mypj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mypj.dao.IFindCenter_dao;
import com.myproject.mypj.vo.FindCenter_dto;

@Service
public class FindCenterService implements IFindCenterService {

	@Autowired
	IFindCenter_dao center;
	
	@Override
	public List<FindCenter_dto> findCenter(String address) 
	{	
		return center.findCenter(address);
	}
	
	@Override
	public List<FindCenter_dto> findCenter2(String address) 
	{	
		return center.findCenter2(address);
	}
}
