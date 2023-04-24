package com.myproject.mypj.dao;

import java.util.List;

import com.myproject.mypj.vo.SuccessWrite_dto;
import com.myproject.mypj.vo.Write_dto;

public interface ISuccessWrite_dao {


	// 한 페이지 당 10개의 게시물 게시
	List<SuccessWrite_dto>successboardList(int pageNumber);

	// 메인페이지 성공사례게시판 부분 7개 노출
	List<SuccessWrite_dto>successMainBoardList();

	// 성공사례 게시판 게시글 조회
	SuccessWrite_dto successreadBoard(int success_write_number);

	// 성공사례 게시판 게시글 수정
	void successboardUpdate(SuccessWrite_dto success_writeDto);

	// 성공사례 게시판 게시글 삭제
	void successdelete(int success_write_number);

	// 성공사례 게시판 게시글 작성
	void successBoardWrite(SuccessWrite_dto success_writeDto);

	// 성공사례 게시판 게시글 조회수
	int success_count(int success_write_number);
	
}
