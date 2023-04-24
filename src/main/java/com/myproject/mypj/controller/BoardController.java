package com.myproject.mypj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.mypj.service.IBoardService;
import com.myproject.mypj.service.IReplyService;
import com.myproject.mypj.service.ISuccessBoardService;
import com.myproject.mypj.service.ISuccessReplyService;
import com.myproject.mypj.vo.SuccessWrite_dto;
import com.myproject.mypj.vo.Write_dto;

@Controller
public class BoardController {

	@Autowired
	@Qualifier("boardService")
	IBoardService service;

	@Autowired
	IReplyService reply_service;
	
	@Autowired
	@Qualifier("successBoardService")
	ISuccessBoardService success_service;
	
	@Autowired
	ISuccessReplyService success_reply_service;
	
	// 자유게시판 페이지로 이동
	@GetMapping(value = "/freeBoard")
	public String freeBoard(int pageNumber,Model model) 
	{
		service.boardList(pageNumber);

		model.addAttribute("boardList",service.boardList(pageNumber));
		model.addAttribute("pageNumber",pageNumber);

		return "freeBoard";
	}

	// 자유게시판 글 읽기 
	@GetMapping(value = "/readBoard.do")
	public String readBoard(int write_number, Model model) 
	{
		model.addAttribute("readBoard", service.readBoard(write_number));

		model.addAttribute("reply", reply_service.replyList(write_number));
		
		service.count(write_number);
		
//		System.out.println(pageNumber);
		
		return "readBoard";
	}

	// 자유게시판 글 수정 페이지 이동
	@PostMapping(value = "/editBoard.do")
	public String editBoard(int write_number,Model model) 
	{
		model.addAttribute("readBoard", service.readBoard(write_number));

		return "editBoard";
	}	

	// 자유게시판 글 수정 진행 페이지
	@RequestMapping(value = "/freeBoardUpdate.do", method=RequestMethod.POST)
	public String freeBoardUpdate(Write_dto writeDto,Model model) 
	{
		service.freeboardUpdate(writeDto);

		model.addAttribute("readBoard", service.readBoard(writeDto.getWrite_number()));
		model.addAttribute("write_number", writeDto.getWrite_number());

		return "redirect:/readBoard.do";
	}

	// 자유게시판 글 삭제 진행
	@PostMapping(value = "/deleteBoard.do")
	public String deleteBoard(int write_number,Model model) 
	{
		service.delete(write_number);

		return "hrefBoard";
	}		


	// 자유게시판 글쓰기 페이지 이동
	@RequestMapping(value = "/main_board_write")
	public String mainBoardWrite() 
	{				
		return "main_board_write";
	}
	
	// 자유게시판 글 쓰기 진행
	@PostMapping(value = "/freewrite.do")
	public String freeBoardWrite(Write_dto writeDto, Model model) 
	{
		service.freeBoardWrite(writeDto);
		
		return "hrefBoard";
	}
	// ------------------------------------------------------------------------------------------------------
	
	
	// 성공사례게시판 페이지로 이동
		@GetMapping(value = "/successBoard")
		public String successBoard(int pageNumber,Model model) 
		{		
			model.addAttribute("success_boardList",success_service.successboardList(pageNumber));
			model.addAttribute("pageNumber",pageNumber);

			return "successBoard";
		}

		// 성공사례게시판 글 읽기 
		@GetMapping(value = "/success_readBoard.do")
		public String success_readBoard(int success_write_number, Model model) 
		{
			model.addAttribute("readBoard", success_service.successreadBoard(success_write_number));

			model.addAttribute("reply", success_reply_service.success_readReply(success_write_number));
			
			success_service.success_count(success_write_number);

			return "successReadBoard";
		}

		// 성공사례게시판 글 수정 페이지 이동
		@PostMapping(value = "/success_editBoard.do")
		public String editBoardSuccess(int success_write_number,Model model) 
		{
			model.addAttribute("readBoard", success_service.successreadBoard(success_write_number));

			return "SuccessEditBoard";
		}	

		// 성공사례게시판 글 수정 진행 페이지
		@RequestMapping(value = "/successBoardUpdate.do", method=RequestMethod.POST)
		public String successBoardUpdate(SuccessWrite_dto success_writeDto,Model model) 
		{
			success_service.successboardUpdate(success_writeDto);
			
			model.addAttribute("readBoard", success_service.successreadBoard(success_writeDto.getSuccess_write_number()));
		
			model.addAttribute("success_write_number",success_writeDto.getSuccess_write_number());

			return "redirect:/success_readBoard.do";
		}

		// 성공사례게시판 글 삭제 진행
		@PostMapping(value = "/success_deleteBoard.do")
		public String successdeleteBoard(int success_write_number,Model model) 
		{
			success_service.successdelete(success_write_number);

			return "successhrefBoard";
		}		

		// 성공사례게시판 글 쓰기 진행
		@PostMapping(value = "/successwrite.do")
		public String successBoardWrite(SuccessWrite_dto success_writeDto, Model model) 
		{
			success_service.successBoardWrite(success_writeDto);
			
			return "successhrefBoard";
		}
}
