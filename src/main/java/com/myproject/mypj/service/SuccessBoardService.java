package com.myproject.mypj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mypj.dao.ISuccessWrite_dao;
import com.myproject.mypj.dao.IWrite_dao;
import com.myproject.mypj.vo.SuccessWrite_dto;
import com.myproject.mypj.vo.Write_dto;

@Service
public class SuccessBoardService implements ISuccessBoardService {

	@Autowired
	ISuccessWrite_dao success_write_dao;

	// 한 페이지 당 10개의 게시물 게시
	@Override
	public List<SuccessWrite_dto> successboardList(int pageNumber) {

		return success_write_dao.successboardList(pageNumber);

	}

	// 메인페이지 성공사례 게시판 부분 7개 노출
	public List<SuccessWrite_dto> successMainBoardList() {

		return success_write_dao.successMainBoardList();
	}

	// 성공사례 게시판 게시글 조회
	@Override
	public SuccessWrite_dto successreadBoard(int success_write_number) {

		return success_write_dao.successreadBoard(success_write_number);
	}

	// 성공사례 게시판 게시글 수정
	@Override
	public void successboardUpdate(SuccessWrite_dto success_writeDto) {

		success_write_dao.successboardUpdate(success_writeDto);
	}

	// 성공사례 게시판 게시글 삭제
	@Override
	public void successdelete(int success_write_number) {

		success_write_dao.successdelete(success_write_number);
	}

	// 성공사례 게시판 게시글 작성
	@Override
	public void successBoardWrite(SuccessWrite_dto success_writeDto) {

		success_write_dao.successBoardWrite(success_writeDto);	
	}

	// 성공사례 게시판 게시글 조회수
	@Override
	public int success_count(int success_write_number)
	{
		return success_write_dao.success_count(success_write_number);
	}
}
