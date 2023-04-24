package com.myproject.mypj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.myproject.mypj.service.IMemberService;
import com.myproject.mypj.vo.Member_dto;

@Controller
public class MyInfoController {

	@Autowired
	IMemberService service;
	
		// 내정보 페이지로 이동
		@GetMapping(value = "/userlist")
		public String userList(String user_id,Model model) 
		{
			Member_dto memberDto = service.readById(user_id);

			model.addAttribute("memberDto", memberDto);
	
			return "InfoChange";
		}
	
		// 내정보 수정 페이지로 이동
		@GetMapping(value = "/InfoChangeResult")
		public String infoChangeResult(String user_id,Model model) 
		{
			Member_dto memberDto = service.readById(user_id);

			model.addAttribute("memberDto", memberDto);
			return "InfoChangeResult";
		}
	
		// 내정보 수정(업데이트) 완료
		@PostMapping(value = "/update.do")
		public String update(Member_dto memberDto,Model model) 
		{
			service.update(memberDto);
			
			return "main";
		}
		
		// 회원탈퇴 페이지 이동
		@PostMapping(value = "/deleteCheck")
		public String deleckCheck(String user_id,Model model) 
		{
			model.addAttribute("user_id", user_id);
			return "deleteCheck";
		}	
		
		// 회원탈퇴 최종 아이디 체크
		@PostMapping(value = "/userDelete.do")
		public String userDelete(String user_id,String user_pw,HttpServletRequest request) 
		{
			HttpSession session = request.getSession();
			
			if(service.Login(user_id, user_pw).equals(user_pw))
			{
				service.delete(user_id);
				session.invalidate();
				return "redirect:/main";
			}
			else
			{
				return "alert";
			}
		}	
}
