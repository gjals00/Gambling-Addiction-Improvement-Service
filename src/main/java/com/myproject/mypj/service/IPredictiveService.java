package com.myproject.mypj.service;

import com.myproject.mypj.vo.Predictive_dto;

public interface IPredictiveService {

	// 도박 수요 증감 예측
	public Predictive_dto predictive1List(String year);
	
	// 도박 범죄 유형별 증감 예측
	public Predictive_dto predictive2List(String year);

	// 도박 중독 치유/재활 참여 예측
	public Predictive_dto predictive3List(String year);
}
