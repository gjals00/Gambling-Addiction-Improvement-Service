package com.myproject.mypj.vo;

import java.sql.Date;

public class SuccessReply_dto {

	private int success_reply_number;
	private int success_write_number;
	private String reply_id;
	private String reply_text;
	private Date reply_time;
	
	
	public int getSuccess_reply_number() {
		return success_reply_number;
	}
	public void setSuccess_reply_number(int success_reply_number) {
		this.success_reply_number = success_reply_number;
	}
	public int getSuccess_write_number() {
		return success_write_number;
	}
	public void setSuccess_write_number(int success_write_number) {
		this.success_write_number = success_write_number;
	}
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public Date getReply_time() {
		return reply_time;
	}
	public void setReply_time(Date reply_time) {
		this.reply_time = reply_time;
	}
}
