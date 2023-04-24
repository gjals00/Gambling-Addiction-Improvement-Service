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
import com.myproject.mypj.vo.SuccessReply_dto;

@Repository
public class SuccessReply_dao implements ISuccessReply_dao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private class EmpMapper2 implements RowMapper<SuccessReply_dto>	
	{
		@Override
		public SuccessReply_dto mapRow(ResultSet rs, int count) throws SQLException
		{
			SuccessReply_dto success_replyDto = new SuccessReply_dto();
			success_replyDto.setSuccess_reply_number(rs.getInt(("success_reply_number")));
			success_replyDto.setSuccess_write_number((rs.getInt("success_write_number")));
			success_replyDto.setReply_id((rs.getString("reply_id")));
			success_replyDto.setReply_text((rs.getString("reply_text")));
			success_replyDto.setReply_time((rs.getDate("reply_time")));
		
			return success_replyDto;
		}
	}	
	
	@Override
	public void success_writeReply(SuccessReply_dto success_replyDto)
	{	
		String sql = "insert into success_reply values (successcount.nextval,?,?,?,?)";
		
		jdbcTemplate.update(sql,
				success_replyDto.getSuccess_write_number(),
				success_replyDto.getReply_id(),
				success_replyDto.getReply_text(),
				java.sql.Timestamp.valueOf(java.time.LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
				);
	}
	
	@Override
	public List<SuccessReply_dto> success_readReply(int success_replyDto)
	{	
		String sql = "select * from success_reply where success_write_number=?";
		
		List<SuccessReply_dto> replyList = jdbcTemplate.query(sql, new EmpMapper2(),success_replyDto);
		
		return replyList;		
	}
	
	@Override
	public void success_deleteReply(int success_reply_number, int success_write_number)
	{
		String sql = "DELETE FROM success_reply where success_reply_number=? and success_write_number=?";
		
		jdbcTemplate.update(sql,success_reply_number,success_write_number);	
	}
//		
//	public void editReply(Reply_dto replyDto)
//	{	
//		
//		String query = "update reply set reply_text=? where reply_number=? and write_number=?";
//
//	
//	public void deleteReply(Reply_dto replyDto)
//	{	
//		
//		String query = "DELETE FROM reply where reply_number=? and write_number=?";

}
