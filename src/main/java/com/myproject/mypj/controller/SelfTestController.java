package com.myproject.mypj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.mypj.vo.SelfTest_dto;

@Controller
public class SelfTestController {

	@RequestMapping(value = "/selfTest")
	public String selfTest() 
	{
		return "selfTest";
	}
	
	@PostMapping(value = "/selfTest.do")
	public String selfTestDo(SelfTest_dto selfDto, Model model) 
	{
	
		model.addAttribute("result", selfDto.result());
		
		return "selfTestResult";	
	}
}
