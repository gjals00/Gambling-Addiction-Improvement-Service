package com.myproject.mypj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.myproject.mypj.vo.Reply_dto;

@Repository
public class Reply_dao implements IReply_dao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	private class EmpMapper implements RowMapper<Reply_dto>	
	{
		@Override
		public Reply_dto mapRow(ResultSet rs, int count) throws SQLException
		{
			Reply_dto replyDto = new Reply_dto();
			replyDto.setReply_number(rs.getInt(("reply_number")));
			replyDto.setWrite_number((rs.getInt("write_number")));
			replyDto.setReply_id((rs.getString("reply_id")));
			replyDto.setReply_text((rs.getString("reply_text")));
			replyDto.setReply_time((rs.getDate("reply_time")));
		
			return replyDto;
		}
	}	
	
	@Override
	public void writeReply(Reply_dto replyDto)
	{	
		String sql = "insert into reply values (count.nextval,?,?,?,?)";
		
		jdbcTemplate.update(sql,
				replyDto.getWrite_number(),
				replyDto.getReply_id(),
				replyDto.getReply_text(),
				java.sql.Timestamp.valueOf(java.time.LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
				);
	}
	
	@Override
	public List<Reply_dto> readReply(int replyDto)
	{	
		String sql = "select * from reply where write_number=?";
		
		List<Reply_dto> replyList = jdbcTemplate.query(sql, new EmpMapper(),replyDto);
		
		return replyList;		
	}
	
	@Override
	public void deleteReply(int reply_number, int write_number)
	{
		String sql = "DELETE FROM reply where reply_number=? and write_number=?";
		
		jdbcTemplate.update(sql,reply_number,write_number);	
	}
	
	@Override
	public void editReply(Reply_dto replyDto)
	{	
		String sql = "update reply set reply_text=? where reply_number=? and write_number=?";
		jdbcTemplate.update(sql, replyDto.getReply_text(),replyDto.getReply_number(),replyDto.getWrite_number());
	}
	
	@Override
	public List<Reply_dto> replyList(int write_number) 
	{
		String sql = "select * from(select rownum rnum, reply_number, write_number, reply_id, reply_text, reply_time from reply order by reply_number ASC) where write_number=?";
		
		List<Reply_dto> reply_list = jdbcTemplate.query(sql, new EmpMapper(), write_number);
		
		return reply_list;
	}
}
