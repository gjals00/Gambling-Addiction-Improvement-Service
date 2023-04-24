package com.myproject.mypj.vo;

import java.sql.Date;

public class Reply_dto {

	private int reply_number;
	private int write_number;
	private String reply_id;
	private String reply_text;
	private Date reply_time;
	
	public Reply_dto() {}
	
	public Reply_dto(int reply_number,int write_number,String reply_id,String reply_text,Date reply_time)
	{
		this.reply_number = reply_number;
		this.write_number = write_number;
		this.reply_id = reply_id;
		this.reply_text = reply_text;
		this.reply_time = reply_time;
	}
	
	public int getReply_number() {
		return reply_number;
	}
	public void setReply_number(int reply_number) {
		this.reply_number = reply_number;
	}
	public int getWrite_number() {
		return write_number;
	}
	public void setWrite_number(int write_number) {
		this.write_number = write_number;
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
