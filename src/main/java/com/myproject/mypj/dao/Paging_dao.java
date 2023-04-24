package com.myproject.mypj.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class Paging_dao implements IPaging_dao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public int count()
	{
		String sql = "select count(*) from freeboard";
		
		int result = jdbcTemplate.queryForObject(sql, Integer.class);
		
		return result;
	}
	
	@Override
	public int success_Count()
	{
		String sql = "select count(*) from successboard";
		
		int result = jdbcTemplate.queryForObject(sql, Integer.class);
		
		return result;
	}
}
