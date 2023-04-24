package com.myproject.mypj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mypj.dao.IReply_dao;
import com.myproject.mypj.vo.Reply_dto;

@Service
public class ReplyService implements IReplyService {
	
	
	@Autowired
	IReply_dao reply_dao;
	
	@Override
	public void writeReply(Reply_dto replyDto)
	{
		reply_dao.writeReply(replyDto);
	}
	
	@Override
	public List<Reply_dto> readReply(int replyDto)
	{
		return reply_dao.readReply(replyDto);
	}
	
	@Override
	public void deleteReply(int reply_number, int write_number)
	{
		reply_dao.deleteReply(reply_number,write_number);
	}

	@Override
	public void editReply(Reply_dto replyDto) 
	{
		reply_dao.editReply(replyDto);
	}

	@Override
	public List<Reply_dto> replyList(int write_number) 
	{
		return reply_dao.replyList(write_number);
	}

}
