package com.myproject.mypj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mypj.dao.IMember_dao;
import com.myproject.mypj.vo.Member_dto;

@Service
public class MemberService implements IMemberService {

	@Autowired
	IMember_dao member_dao;

	@Override
	public int getEmpCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Member_dto> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member_dto readById(String user_id) {
	
		return member_dao.readById(user_id);
	}

	@Override
	public void update(Member_dto memberDto) {
		
		member_dao.update(memberDto);	
	}

	@Override
	public void insert(Member_dto memberDto) {
		
		member_dao.insert(memberDto);
		
	}

	@Override
	public void delete(String user_id) {
		member_dao.delete(user_id);
		
	}

	@Override
	public String Login(String user_id, String user_pw) {
		
		return member_dao.Login(user_id, user_pw);
	}
	
	// 회원가입 아이디 중복 체크
	@Override
	public String idCheck(String user_id)
	{
		String id = member_dao.idCheck(user_id);
		
		if((id.equals("null")))
		{
			return user_id;
		}
		else 
		{
			return null;
		}
	}
	
	// 로그인 아이디 찾기
	@Override
	public String findId(String user_name, String user_tel, String user_email)
	{
		String id = member_dao.findId(user_name, user_tel, user_email);
		
		if(id.equals("null"))
		{
			return null;
		}
		else 
		{
			return id;
		}
	}
	// 로그인 비밀번호 찾기
	@Override
	public String findPw(String user_id, String user_tel, String user_email)
	{
		String pw = member_dao.findPw(user_id, user_tel, user_email);
		
		if(pw.equals("null"))
		{
			return null;
		}
		else 
		{
			return pw;
		}
	}
}
