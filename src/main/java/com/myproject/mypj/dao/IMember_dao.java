package com.myproject.mypj.dao;

import java.util.List;
import com.myproject.mypj.vo.Member_dto;

public interface IMember_dao {


	int getEmpCount();
	List<Member_dto> getList();
	Member_dto readById(String id);
	String Login(String user_id, String user_pw);
	void update(Member_dto memberDto);
	void insert(Member_dto memberDto);
	void delete(String user_id);

	String idCheck(String user_id);

	String findId(String user_name, String user_tel, String user_email);
	String findPw(String user_id, String user_tel, String user_email);

}

