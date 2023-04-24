package com.myproject.mypj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.myproject.mypj.vo.Member_dto;
	
@Repository
public class Member_dao implements IMember_dao {

	@Autowired
	JdbcTemplate jdbcTemplate;	
	
	private class EmpMapper implements RowMapper<Member_dto>	
	{
	@Override
	public Member_dto mapRow(ResultSet rs, int count) throws SQLException
	{
		Member_dto memberDto = new Member_dto();
		memberDto.setUser_id(rs.getString("user_id"));
		memberDto.setUser_pw(rs.getString("user_pw"));
		memberDto.setUser_name(rs.getString("user_name"));
		memberDto.setUser_birthday(rs.getString("user_birthday"));
		memberDto.setUser_gender(rs.getString("user_gender"));
		memberDto.setUser_email(rs.getString("user_email"));
		memberDto.setUser_tel(rs.getString("user_tel"));
		memberDto.setUser_register(rs.getTimestamp("user_register"));
		
		return memberDto;
	}
}
	
	@Override
	public int getEmpCount() {
		String sql = "select count(*) from members";
		return jdbcTemplate.queryForObject(sql,Integer.class);
	}

//	@Override
//	public int getEmpCount(int deptid) {
//		String sql = "select count(*) from employees where department_id=?";
//		return jdbcTemplate.queryForObject(sql,Integer.class,deptid);
//	}

	@Override
	public List<Member_dto> getList() {
		String sql="select*from members";
		return jdbcTemplate.query(sql, new RowMapper<Member_dto>()
			   {
					@Override
					public Member_dto mapRow(ResultSet rs, int count) throws SQLException
					{
						Member_dto memberDto = new Member_dto();
						memberDto.setUser_id(rs.getString("user_id"));
						memberDto.setUser_pw(rs.getString("user_pw"));
						memberDto.setUser_name(rs.getString("user_name"));
						memberDto.setUser_birthday(rs.getString("user_birthday"));
						memberDto.setUser_gender(rs.getString("user_gender"));
						memberDto.setUser_email(rs.getString("user_email"));
						memberDto.setUser_tel(rs.getString("user_tel"));
						memberDto.setUser_register(rs.getTimestamp("user_register"));
						
						
						return memberDto;
					}
			   });
	}

//	@Override
//	public Member_dto getEmpInfo(int empid) {
//		String sql="select employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id from employees where employee_id=?";
//		return jdbcTemplate.queryForObject(sql,new EmpMapper(), empid);
//	}
	
	@Override
	public Member_dto readById(String user_id) {
		String sql = "select * from members where user_id =?";
		// String sql = "select user_id,user_name,user_birthday,user_gender,user_email,user_tel from members where user_id=?";
		
		return jdbcTemplate.queryForObject(sql, new EmpMapper(), user_id);
	}
	
	@Override
	public String Login(String user_id, String user_pw)
	{
		String sql = "select user_pw from members where user_id=?";
		
		if(idCheck(user_id).equals("null"))
		{
			return "null";
		}
		else
		{
			return jdbcTemplate.queryForObject(sql,
					(resultSet, rowNum) -> resultSet.getString("user_pw"), user_id);
		}		
//		return jdbcTemplate.queryForObject(sql,String.class, user_id,user_pw);
	}
		
	@Override
	public void insert(Member_dto memberDto) {
		String sql="insert into members values (?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql,
				memberDto.getUser_id(),
				memberDto.getUser_pw(),
				memberDto.getUser_name(),
				memberDto.getUser_birthday(),
				memberDto.getUser_gender(),
				memberDto.getUser_email(),
				memberDto.getUser_tel(),
				java.sql.Timestamp.valueOf(java.time.LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
				);
	}


//	@Override
//	public void deleteJobHistory(int empid) {
//		String sql="delete from job_history where employee_id=?";
//		jdbcTemplate.update(sql,empid);
//		
//	}
	
	@Override
	public void update(Member_dto memberDto) {
		String sql="UPDATE MEMBERS SET user_pw=?, user_name=?, user_birthday=?, user_gender=?, user_email=?,user_tel=? WHERE user_id=?";
		
		jdbcTemplate.update(sql,memberDto.getUser_pw(),
				memberDto.getUser_name(),
				memberDto.getUser_birthday(),
				memberDto.getUser_gender(),
				memberDto.getUser_email(),
				memberDto.getUser_tel(),
				memberDto.getUser_id()
				);
	}

	@Override
	public void delete(String user_id) {
		String sql="DELETE FROM MEMBERS where user_id =?";
		jdbcTemplate.update(sql,user_id);	
	}
	
	@Override
	public String idCheck(String user_id)
	{
		String sql = "select NVL(MAX(user_id), 'null') from members where user_id=?";
		return jdbcTemplate.queryForObject(sql, String.class, user_id);
	}
	
	@Override
	public String findId(String user_name, String user_tel, String user_email)
	{
		String sql = "select NVL(MAX(user_id), 'null') from members where user_name=? and user_tel=? and user_email=?";
		
		return jdbcTemplate.queryForObject(sql, String.class, user_name,user_tel,user_email);
	}
	
	@Override
	public String findPw(String user_id, String user_tel, String user_email)
	{
		String sql = "select NVL(MAX(user_pw), 'null') from members where user_id=? and user_tel=? and user_email=?";
		
		return jdbcTemplate.queryForObject(sql, String.class, user_id,user_tel,user_email);
	}
}
