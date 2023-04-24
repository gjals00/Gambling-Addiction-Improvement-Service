package com.myproject.mypj.dao;

import java.util.List;

import com.myproject.mypj.vo.SuccessReply_dto;

public interface ISuccessReply_dao {

	public void success_writeReply(SuccessReply_dto success_replyDto);
	public List<SuccessReply_dto> success_readReply(int success_replyDto);
	public void success_deleteReply(int success_reply_number, int success_write_number);
	
}
