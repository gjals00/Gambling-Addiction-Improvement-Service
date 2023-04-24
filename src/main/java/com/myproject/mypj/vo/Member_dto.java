package com.myproject.mypj.vo;

import java.sql.Timestamp;

public class Member_dto {


	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_birthday;
	private String user_gender;
	private String user_email;
	private String user_tel;
	private Timestamp user_register;
	
	public Member_dto() {}
	
	public Member_dto(String user_id,String user_pw,String user_name,String user_birthday,String user_gender,String user_email,String user_tel)
	{
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_birthday = user_birthday;
		this.user_gender = user_gender;
		this.user_email = user_email;
		this.user_tel = user_tel;
	}
	
	public Member_dto(String user_id,String user_pw,String user_name,String user_birthday,String user_gender,String user_email,String user_tel,Timestamp user_register)
	{
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_birthday = user_birthday;
		this.user_gender = user_gender;
		this.user_email = user_email;
		this.user_tel = user_tel;
		this.user_register = user_register;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_birthday() {
		return user_birthday;
	}

	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	
	
	public Timestamp getUser_register() {
		return user_register;
	}

	public void setUser_register(Timestamp user_register) {
		this.user_register = user_register;
	}

	public boolean matchPassword(String user_pw)
	{
		return user_pw.equals(user_pw);
	}
}

	

