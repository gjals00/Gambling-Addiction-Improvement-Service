package com.myproject.mypj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mypj.dao.IPredictive_dao;
import com.myproject.mypj.vo.Predictive_dto;

@Service
public class PredictiveService implements IPredictiveService {

	@Autowired
	IPredictive_dao predictive_dao;
	
	@Override
	public Predictive_dto predictive1List(String year) 
	{
		return predictive_dao.predictive1List(year);	 
	}

	@Override
	public Predictive_dto predictive2List(String year) {
		
		return predictive_dao.predictive2List(year);
	}

	@Override
	public Predictive_dto predictive3List(String year) {
		
		return predictive_dao.predictive3List(year);
	}

}
