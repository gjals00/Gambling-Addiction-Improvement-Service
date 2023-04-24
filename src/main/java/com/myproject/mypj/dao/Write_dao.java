package com.myproject.mypj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.myproject.mypj.vo.Paging_dto;
import com.myproject.mypj.vo.Write_dto;

	
@Repository
public class Write_dao implements IWrite_dao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private class EmpMapper implements RowMapper<Write_dto>	
	{
	@Override
	public Write_dto mapRow(ResultSet rs, int count) throws SQLException
	{
		Write_dto writeDto = new Write_dto();
		writeDto.setWrite_number(rs.getInt("write_number"));
		writeDto.setWrite_title(rs.getString("write_title"));
		writeDto.setWrite_id(rs.getString("write_id"));
		writeDto.setWrite_time(rs.getDate("write_time"));
		writeDto.setWrite_text(rs.getString("write_text"));
		writeDto.setWrite_available(rs.getInt("write_available"));
		
		
		return writeDto;
	}
}
	
	// 한 페이지 당 10개의 게시물 게시
	@Override
	public List<Write_dto> boardList(int pageNumber)
	{
		String sql = "select * from (select rownum rnum, write_number, write_title, write_id, write_time, write_text, write_available from freeboard order by write_number desc) where rnum between ? and ?";
		
		Paging_dto page = new Paging_dto();
		int first = page.firstPage(pageNumber);
		int last = page.lastPage(pageNumber);
		
		
		List<Write_dto> freeBoardList = jdbcTemplate.query(sql, new EmpMapper(),first,last);
		
		return freeBoardList;		
	}
	
	// 메인페이지 자유게시판 부분 7개 노출
	@Override
	public List<Write_dto> MainBoardList()
	{
		String sql = "select * from (select rownum rnum, write_number, write_title, write_id, write_time, write_text, write_available from freeboard order by write_number desc) where rnum between ? and ?";
		
		int first = 1;
		int last = 7;
		
		
		List<Write_dto> freeBoardList2 = jdbcTemplate.query(sql, new EmpMapper(),first,last);
		
		return freeBoardList2;		
	}
	
	// 자유게시판 게시글 조회
	@Override
	public Write_dto readBoard(int write_number)
	{
		String sql = "SELECT*FROM freeboard where write_number=?";
		
		return jdbcTemplate.queryForObject(sql, new EmpMapper(), write_number);
	}
	
	// 자유게시판 게시글 수정
	@Override
	public void freeboardUpdate(Write_dto writeDto)
	{
		String sql = "UPDATE freeboard SET write_title=?, write_text=? WHERE write_number=?";
		
		jdbcTemplate.update(sql,writeDto.getWrite_title(),
				writeDto.getWrite_text(),
				writeDto.getWrite_number()
				);		
	}
	
	// 자유게시판 게시글 삭제
	@Override
	public void delete(int write_number)
	{
		String sql = "DELETE FROM freeboard where write_number=?";
		
		jdbcTemplate.update(sql,write_number);
	}
	
	// 자유게시판 게시글 작성
	@Override
	public void freeBoardWrite(Write_dto writeDto) 
	{
		
		String sql = "insert into freeboard values (count_write.nextval,?,?,?,?,?,?)";
		
		jdbcTemplate.update(sql, writeDto.getWrite_title(),
				writeDto.getWrite_id(),
				java.sql.Date.valueOf(java.time.LocalDate.now()),
				writeDto.getWrite_text(),
				0,
				0);
	}

	// 자유게시판 게시글 조회수
	@Override
	public int count(int write_number)
	{
		String sql = "update freeboard set write_available = write_available+1 where write_number=?";
		
		return jdbcTemplate.update(sql,write_number);
	}
}
