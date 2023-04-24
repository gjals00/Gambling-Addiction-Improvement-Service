package com.myproject.mypj.vo;

import java.sql.Date;

public class Write_dto {


	private int write_number;
	private String write_title;
	private String write_id;
	private Date write_time;
	private String write_text;
	private int write_available;
	private int count;
	
	
	public Write_dto() {}
	
	public Write_dto(int write_number,String write_title,String write_id,String write_text,int write_available)
	{
		this.write_number = write_number;
		this.write_title = write_title;
		this.write_id = write_id;
		this.write_text = write_text;
		this.write_available = write_available;
	}
	
	public Write_dto(int write_number,String write_title,String write_id,Date write_time,String write_text,int write_available)
	{
		this.write_number = write_number;
		this.write_title = write_title;
		this.write_id = write_id;
		this.write_time = write_time;
		this.write_text = write_text;
		this.write_available = write_available;
	}

	public int getWrite_number() {
		return write_number;
	}

	public void setWrite_number(int write_number) {
		this.write_number = write_number;
	}

	public String getWrite_title() {
		return write_title;
	}

	public void setWrite_title(String write_title) {
		this.write_title = write_title;
	}

	public String getWrite_id() {
		return write_id;
	}

	public void setWrite_id(String write_id) {
		this.write_id = write_id;
	}

	public Date getWrite_time() {
		return write_time;
	}

	public void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}

	public String getWrite_text() {
		return write_text;
	}

	public void setWrite_text(String write_text) {
		this.write_text = write_text;
	}

	public int getWrite_available() {
		return write_available;
	}

	public void setWrite_available(int write_available) {
		this.write_available = write_available;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
