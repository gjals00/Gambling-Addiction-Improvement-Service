package com.myproject.mypj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mypj.dao.ISuccessReply_dao;
import com.myproject.mypj.vo.SuccessReply_dto;

@Service
public class SuccessReplyService implements ISuccessReplyService {

	@Autowired
	ISuccessReply_dao success_reply_dao;
	
	@Override
	public void success_writeReply(SuccessReply_dto success_replyDto) 
	{
		success_reply_dao.success_writeReply(success_replyDto);	
	}

	@Override
	public List<SuccessReply_dto> success_readReply(int success_replyDto) 
	{
		return success_reply_dao.success_readReply(success_replyDto);
	}

	@Override
	public void success_deleteReply(int success_reply_number, int success_write_number) 
	{
		success_reply_dao.success_deleteReply(success_reply_number, success_write_number);
	}
}
