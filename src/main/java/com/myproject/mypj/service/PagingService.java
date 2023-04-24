package com.myproject.mypj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mypj.dao.IPaging_dao;

@Service
public class PagingService implements IPagingService {

	@Autowired
	IPaging_dao paging_dao;
	
	@Override
	public int count() {
		
		return paging_dao.count();
	}
	
	@Override
	public int success_Count() {
		
		return paging_dao.success_Count();
	}

}
