package com.myproject.mypj.service;

import java.util.List;

import com.myproject.mypj.vo.Member_dto;

public interface IMemberService {

	
	int getEmpCount();
//	int getEmpCount(int depid);
	List<Member_dto> getList();
//	Member_dto getEmpInfo(int empid);
	Member_dto readById(String id);
	String Login(String user_id, String user_pw);
	void update(Member_dto memberDto);
	void insert(Member_dto memberDto);
//	void deleteJobHistory(int empid);
	void delete(String user_id);
	
	String idCheck(String user_id);
	
	String findId(String user_name, String user_tel, String user_email);
	String findPw(String user_id, String user_tel, String user_email);
	
}
