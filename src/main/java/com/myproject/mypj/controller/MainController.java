package com.myproject.mypj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.mypj.service.IBoardService;
import com.myproject.mypj.service.ISuccessBoardService;

@Controller
public class MainController {

	@Autowired
	@Qualifier("boardService")
	IBoardService service;

	@Autowired
	@Qualifier("successBoardService")
	ISuccessBoardService success_service;
	
	// 메인 페이지로 이동
	
	@RequestMapping(value = "/main")
	public String Main(Model model) 
	{
		service.MainBoardList();
		success_service.successMainBoardList();
		
		model.addAttribute("boardList",service.MainBoardList());
		model.addAttribute("success_boardList",success_service.successMainBoardList());
		model.addAttribute("pageNumber",1);

		return "main";
	}
	
	 @RequestMapping(value = "/test")
	public String test() 
	{
		

		return "test";
	}
}
