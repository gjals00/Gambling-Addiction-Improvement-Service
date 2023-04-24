package com.myproject.mypj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.mypj.service.IMemberService;

@Controller
public class MainLoginController {
	
	@Autowired
	IMemberService service;
	
	// 로그인 페이지로 이동
	@RequestMapping(value = "/main_login")
	public String main_login() 
	{
		return "main_login";
	}
		
	// 로그인  수행
	@PostMapping(value = "/login.do")
	public String main_login_try(String user_id,String user_pw,HttpServletRequest request) 
	{
		HttpSession session = request.getSession();

		if(!(service.Login(user_id, user_pw).equals(user_pw)))
		{
			session.setAttribute("user_id", null);
			return "alert";
		}
		else
		{
			session.setAttribute("user_id", user_id);
			return "redirect:/main";
		}
	}	
	
	// 로그아웃 수행
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request) {
	    
		HttpSession session = request.getSession();
	    if (session != null) 
	    {
	        session.invalidate();
	    }
	    return "redirect:/main";
	}
	
	// 아이디 찾기 페이지로 이동
	@RequestMapping(value = "/find_id")
	public String findId()
	{
		return "find_id";
	}
	// 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "/find_pw")
	public String findPw()
	{
		return "find_pw";
	}
	// 회원가입 페이지로 이동
	@RequestMapping(value = "/membership")
	public String membershipPage() 
	{
		return "membership";
	}
	
	// 아이디 찾기 수행
	@PostMapping(value = "/findId.do")
	public String findId(String user_name, String user_tel, String user_email,Model model)
	{
		service.findId(user_name, user_tel, user_email);
		
		String id = service.findId(user_name, user_tel, user_email);
		
		if(id == null)
		{
			return "alert";
		}
		else
		{
			model.addAttribute("find_id", id);
			return "find_result";
		}
	}
	
	// 비밀번호 찾기 수행
	@PostMapping(value = "/findPw.do")
	public String findPw(String user_id, String user_tel, String user_email,Model model)
	{
		service.findPw(user_id, user_tel, user_email);
		
		String pw = service.findPw(user_id, user_tel, user_email);

		if(pw == null)
		{
			return "alert";
		}
		else
		{
			model.addAttribute("find_pw", pw);
			return "find_result";
		}
	}
}
