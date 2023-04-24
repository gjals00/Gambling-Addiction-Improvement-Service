package com.myproject.mypj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.mypj.service.IReplyService;
import com.myproject.mypj.service.ISuccessReplyService;
import com.myproject.mypj.vo.Reply_dto;
import com.myproject.mypj.vo.SuccessReply_dto;

@Controller
public class ReplyController {

	@Autowired
	IReplyService service;
	
	@Autowired
	ISuccessReplyService success_service;

	// 자유게시판 댓글 작성
	@PostMapping(value = "/writereply.do")
	public String writeReply(Reply_dto replyDto, Model model) 
	{

		service.writeReply(replyDto);

		model.addAttribute("write_number",replyDto.getWrite_number());

		return "redirect:/readBoard.do";
	}

	// 자유게시판 댓글 삭제
	@RequestMapping(value = "/deletereply.do", method=RequestMethod.GET)
	public String deleteReply(Reply_dto replyDto, Model model) 
	{

		System.out.println(replyDto.getReply_number());
		System.out.println(replyDto.getWrite_number());

		service.deleteReply(replyDto.getReply_number(),replyDto.getWrite_number());
		model.addAttribute("write_number",replyDto.getWrite_number());

		return "redirect:/readBoard.do";
	}
	
	// 자유게시판 댓글 수정 페이지 이동
			@GetMapping(value = "/editreplyPage.do")
			public String editReplyPage(Reply_dto replyDto, Model model) 
			{

				System.out.println(replyDto.getReply_number());
				System.out.println(replyDto.getWrite_number());
				
				model.addAttribute("reply",replyDto);
	
				return "editReply";
			}
	
	// 자유게시판 댓글 수정
		@RequestMapping(value = "/editreply.do", method=RequestMethod.POST)
		public String editReply(Reply_dto replyDto, Model model) 
		{

			System.out.println(replyDto.getReply_number());
			System.out.println(replyDto.getWrite_number());
			System.out.println(replyDto.getReply_text());
			
			service.editReply(replyDto);
			model.addAttribute("write_number",replyDto.getWrite_number());

			return "redirect:/readBoard.do";
		}
	

	// 성공사례 게시판 댓글 작성
	@PostMapping(value = "/success_writereply.do")
	public String success_writeReply(SuccessReply_dto success_replyDto, Model model) 
	{

		success_service.success_writeReply(success_replyDto);

		model.addAttribute("success_write_number",success_replyDto.getSuccess_write_number());

		return "redirect:/success_readBoard.do";
	}

	// 성공사례 게시판 댓글 삭제
	@RequestMapping(value = "/success_deletereply.do", method=RequestMethod.POST)
	public String success_deleteReply(SuccessReply_dto success_replyDto, Model model) 
	{

		success_service.success_deleteReply(success_replyDto.getSuccess_reply_number(), success_replyDto.getSuccess_write_number());

		model.addAttribute("success_write_number",success_replyDto.getSuccess_write_number());

		return "redirect:/success_readBoard.do";
	}
}
