package com.myproject.mypj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.myproject.mypj.vo.FindCenter_dto;

@Repository
public class FindCenter_dao implements IFindCenter_dao {

	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	private class EmpMapper implements RowMapper<FindCenter_dto>	
	{
	@Override
	public FindCenter_dto mapRow(ResultSet rs, int count) throws SQLException
	{
		FindCenter_dto center = new FindCenter_dto();
		center.setCENTER_NAME(rs.getString("CENTER_NAME"));
		center.setPOSTAL_CODE(rs.getString("POSTAL_CODE"));
		center.setADDRESS(rs.getString("ADDRESS"));
		center.setADDRESS2(rs.getString("ADDRESS2"));
		center.setNUMBER1(rs.getString("NUMBER1"));
		center.setNUMBER2(rs.getString("NUMBER2"));
		center.setNUMBER3(rs.getString("NUMBER3"));
		center.setFAX1(rs.getString("FAX1"));
		center.setFAX2(rs.getString("FAX2"));
		center.setFAX3(rs.getString("FAX3"));
		center.setURL(rs.getString("URL"));
		
		return center;
	}
	
	}

	@Override
	public List<FindCenter_dto> findCenter(String ADDRESS) {
		
		String sql ="select * from center where address LIKE ?";
		
		String address2 = "%"+ADDRESS.substring(0,3).trim()+"%";
		
		return jdbcTemplate.query(sql, new EmpMapper(), address2);	
	}

	@Override
	public List<FindCenter_dto> findCenter2(String ADDRESS) {
		
		String sql ="select * from center where address LIKE ?";
		
		String address2 = "%"+ADDRESS+"%";
		
		return jdbcTemplate.query(sql, new EmpMapper(), address2);
	}
}
