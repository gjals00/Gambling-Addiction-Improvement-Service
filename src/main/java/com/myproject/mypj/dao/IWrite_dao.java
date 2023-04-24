package com.myproject.mypj.dao;

import java.util.List;

import com.myproject.mypj.vo.Write_dto;

public interface IWrite_dao {

	// 한 페이지 당 10개의 게시물 게시
	List<Write_dto> boardList(int pageNumber);

	// 메인페이지 자유게시판 부분 7개 노출
	List<Write_dto> MainBoardList();

	// 자유게시판 게시글 조회
	Write_dto readBoard(int write_number);

	// 자유게시판 게시글 수정
	void freeboardUpdate(Write_dto writeDto);

	// 자유게시판 게시글 삭제
	void delete(int write_number);

	// 자유게시판 게시글 작성
	void freeBoardWrite(Write_dto writeDto);

	// 자유게시판 게시글 조회수
	int count(int write_number);

}
