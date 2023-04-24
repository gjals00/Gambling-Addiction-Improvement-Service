package com.myproject.mypj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.myproject.mypj.vo.Paging_dto;
import com.myproject.mypj.vo.SuccessWrite_dto;
import com.myproject.mypj.vo.Write_dto;

@Repository
public class SuccessWrite_dao implements ISuccessWrite_dao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	private class EmpMapper2 implements RowMapper<SuccessWrite_dto>	
	{
	@Override
	public SuccessWrite_dto mapRow(ResultSet rs, int count) throws SQLException
	{
		SuccessWrite_dto success_writeDto = new SuccessWrite_dto();
		success_writeDto.setSuccess_write_number(rs.getInt("success_write_number"));
		success_writeDto.setWrite_title(rs.getString("write_title"));
		success_writeDto.setWrite_id(rs.getString("write_id"));
		success_writeDto.setWrite_time(rs.getDate("write_time"));
		success_writeDto.setWrite_text(rs.getString("write_text"));
		success_writeDto.setWrite_available(rs.getInt("write_available"));
		
		
		return success_writeDto;
	}
}
	
	// 한 페이지 당 10개의 게시물 게시
		@Override
		public List<SuccessWrite_dto> successboardList(int pageNumber)
		{
			String sql = "select * from (select rownum rnum, success_write_number, write_title, write_id, write_time, write_text, write_available from successboard order by success_write_number desc) where rnum between ? and ?";

			Paging_dto page = new Paging_dto();
			int first = page.firstPage(pageNumber);
			int last = page.lastPage(pageNumber);


			List<SuccessWrite_dto> successBoardList = jdbcTemplate.query(sql, new EmpMapper2(),first,last);

			return successBoardList;		
		}

		// 메인페이지 성공사례 게시판 부분 7개 노출
		@Override
		public List<SuccessWrite_dto> successMainBoardList()
		{
			String sql = "select * from (select rownum rnum, success_write_number, write_title, write_id, write_time, write_text, write_available from successboard order by success_write_number desc) where rnum between ? and ?";

			int first = 1;
			int last = 7;


			List<SuccessWrite_dto> successBoardList2 = jdbcTemplate.query(sql, new EmpMapper2(),first,last);

			return successBoardList2;		
		}

		// 성공사례 게시판 게시글 조회
		@Override
		public SuccessWrite_dto successreadBoard(int success_write_number)
		{
			String sql = "SELECT*FROM successboard where success_write_number=?";

			return jdbcTemplate.queryForObject(sql, new EmpMapper2(), success_write_number);
		}

		// 성공사례 게시판 게시글 수정
		@Override
		public void successboardUpdate(SuccessWrite_dto success_writeDto)
		{
			String sql = "UPDATE successboard SET write_title=?, write_text=? WHERE success_write_number=?";

			jdbcTemplate.update(sql,success_writeDto.getWrite_title(),
					success_writeDto.getWrite_text(),
					success_writeDto.getSuccess_write_number()
					);		
		}

		// 성공사례 게시판 게시글 삭제
		@Override
		public void successdelete(int success_write_number)
		{
			String sql = "DELETE FROM successboard where success_write_number=?";

			jdbcTemplate.update(sql,success_write_number);
		}

		// 성공사례 게시판 게시글 작성
		@Override
		public void successBoardWrite(SuccessWrite_dto success_writeDto) 
		{

			String sql = "insert into successboard values (successcount_write.nextval,?,?,?,?,?)";

			jdbcTemplate.update(sql, success_writeDto.getWrite_title(),
					success_writeDto.getWrite_id(),
					java.sql.Date.valueOf(java.time.LocalDate.now()),
					success_writeDto.getWrite_text(),
					0);
		}

		// 성공사례 게시판 게시글 조회수
		@Override
		public int success_count(int success_write_number)
		{
			String sql = "update successboard set write_available = write_available+1 where success_write_number=?";

			return jdbcTemplate.update(sql,success_write_number);
		}
}
