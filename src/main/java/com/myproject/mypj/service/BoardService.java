package com.myproject.mypj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mypj.dao.IWrite_dao;
import com.myproject.mypj.vo.Write_dto;

@Service
public class BoardService implements IBoardService {

	@Autowired
	IWrite_dao write_dao;
	
	// 한 페이지 당 10개의 게시물 게시
	@Override
	public List<Write_dto> boardList(int pageNumber) {
		
		return write_dao.boardList(pageNumber);
		
	}
	
	// 메인페이지 자유게시판 부분 7개 노출
	public List<Write_dto> MainBoardList() {

		return write_dao.MainBoardList();
	}

	// 자유게시판 게시글 조회
	@Override
	public Write_dto readBoard(int write_number) {

		return write_dao.readBoard(write_number);

	}

	// 자유게시판 게시글 수정
	@Override
	public void freeboardUpdate(Write_dto writeDto) {

		write_dao.freeboardUpdate(writeDto);
	}

	// 자유게시판 게시글 삭제
	@Override
	public void delete(int write_number) {

		write_dao.delete(write_number);
	}

	// 자유게시판 게시글 작성
	@Override
	public void freeBoardWrite(Write_dto writeDto) {

		write_dao.freeBoardWrite(writeDto);	
	}

	// 자유게시판 게시글 조회수
	@Override
	public int count(int write_number)
	{
		return write_dao.count(write_number);
	}
}
