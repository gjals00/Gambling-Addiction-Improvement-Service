package com.myproject.mypj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.myproject.mypj.service.IMemberService;
import com.myproject.mypj.vo.Member_dto;

@Controller
public class MembershipController {

	@Autowired
	IMemberService service;
	
	// 회원가입 아이디 중복체크 수행
	@PostMapping(value = "/membershipIdCheck.do")
	public String membershipIdCheck(String user_id,Model model) 
	{
		String id = service.idCheck(user_id);
		
		if(id == null)
		{
			model.addAttribute("idCheckOk",null);
			return "idCheck_alert";		
		}
		else
		{
			model.addAttribute("idCheckOk",id);
			return "membership";
		}
	}
		
	// 회원가입 수행
	@PostMapping(value = "/insert.do")
	public String membership(Member_dto memberDto) 
	{
		service.insert(memberDto);
		return "redirect:/main";
	}
				
}
