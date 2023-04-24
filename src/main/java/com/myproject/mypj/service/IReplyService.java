package com.myproject.mypj.service;

import java.util.List;

import com.myproject.mypj.vo.Reply_dto;

public interface IReplyService {

	
	public void writeReply(Reply_dto replyDto);
	public List<Reply_dto> readReply(int replyDto);
	public void deleteReply(int reply_number, int write_number);
	public void editReply(Reply_dto replyDto);
	
	List<Reply_dto> replyList(int write_number);
}
