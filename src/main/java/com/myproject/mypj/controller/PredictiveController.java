package com.myproject.mypj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.mypj.service.IPredictiveService;
import com.myproject.mypj.vo.Predictive_dto;

@Controller
public class PredictiveController {

	@Autowired
	IPredictiveService service;
	
	@RequestMapping(value = "/predictive1")
	public String predictive1() 
	{
		return "predictive1";
	}
	
	@PostMapping(value = "/predictive1Result.do")
	public String predictive1Result(Predictive_dto dto, Model model) 
	{
		
		
		Predictive_dto predDto = service.predictive1List(dto.getYear());
		Predictive_dto predDto_past = service.predictive1List((Integer.parseInt(dto.getYear())-1)+"");
	
		if(dto.getMan() == null)
		{
			predDto.setMan(null);
		}
		if(dto.getWoman() == null)
		{
			predDto.setWoman(null);
		}
		if(dto.getSeoul() == null)
		{
			predDto.setSeoul(null);
		}
		if(dto.getGyeonggido() == null)
		{
			predDto.setGyeonggido(null);
		}
		if(dto.getOthercity() == null)
		{
			predDto.setOthercity(null);
		}
		if(dto.getTeenage() == null)
		{
			predDto.setTeenage(null);
		}
		if(dto.getTwenty() == null)
		{
			predDto.setTwenty(null);
		}
		if(dto.getThirty() == null)
		{
			predDto.setThirty(null);
		}
		if(dto.getOtherage() == null)
		{
			predDto.setOtherage(null);
		}

		model.addAttribute("predictive", predDto);
		model.addAttribute("predictive_past", predDto_past);
		
		
		
		return "predictive1Result";
		

	}
	
	@RequestMapping(value = "/predictive2")
	public String predictive2() 
	{
		return "predictive2";
	}
	
	@PostMapping(value = "/predictive2Result.do")
	public String predictive2Result(Predictive_dto dto, Model model) 
	{
		Predictive_dto predDto = service.predictive2List(dto.getYear());
		Predictive_dto predDto_past = service.predictive2List((Integer.parseInt(dto.getYear())-1)+"");
				
		if(dto.getToto() == null)
		{
			predDto.setToto(null);
		}
		if(dto.getHorse() == null)
		{
			predDto.setHorse(null);
		}
		if(dto.getCasino() == null)
		{
			predDto.setCasino(null);
		}
		if(dto.getOthergame() == null)
		{
			predDto.setOthergame(null);
		}
		
		model.addAttribute("predictive", predDto);
		model.addAttribute("predictive_past", predDto_past);
		
		return "predictive2Result";
	}
	
	@RequestMapping(value = "/predictive3")
	public String predictive3() 
	{
		return "predictive3";
	}
	
	@PostMapping(value = "/predictive3Result.do")
	public String predictive3Result(Predictive_dto dto, Model model) 
	{
		Predictive_dto predDto = service.predictive3List(dto.getYear());
		Predictive_dto predDto_past = service.predictive3List((Integer.parseInt(dto.getYear())-1)+"");
		
		if(dto.getSelfhealing() == null)
		{
			predDto.setSelfhealing(null);
		}
		if(dto.getGrouphealing() == null)
		{
			predDto.setGrouphealing(null);
		}
		if(dto.getSelfcounseling() == null)
		{
			predDto.setSelfcounseling(null);
		}
		if(dto.getGroupcounseling() == null)
		{
			predDto.setGroupcounseling(null);
		}
		
		model.addAttribute("predictive", predDto);
		model.addAttribute("predictive_past", predDto_past);
		
		return "predictive3Result";
	}
}
