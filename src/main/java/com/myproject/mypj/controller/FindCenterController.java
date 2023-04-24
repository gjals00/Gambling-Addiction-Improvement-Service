package com.myproject.mypj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.mypj.service.IFindCenterService;
import com.myproject.mypj.vo.FindCenter_dto;

@Controller
public class FindCenterController {

	@Autowired
	IFindCenterService service;
	
	@RequestMapping(value = "/map")
	public String map() 
	{
		return "map";
	}
	
	@PostMapping(value = "/findcenter.do")
	public String findCenter(String ADDRESS, Model model) 
	{

		System.out.println(ADDRESS); // 내 현재 위치
		String resultAddress = ADDRESS.substring(0,3).trim(); // 내 현재위치의 넓은 범위 ex) 서울특별시, 경기도
		
		String myLocation = ADDRESS.split(" ")[1]; // 내 현재위치의 구 or 시 
		
		int count = 0;
		
		List<FindCenter_dto> result = service.findCenter(resultAddress);
		
		String[] findLocation = new String[result.size()];
				
		for(int i=0; i< findLocation.length; i++) // 내 현재위치의 넓은 범위 구 or 시
		{
			findLocation[i] = result.get(i).getADDRESS().split(" ")[1];	
			
			if(findLocation[i].equals(myLocation))
			{
				model.addAttribute("address",result.get(i).getADDRESS());	
				count++;
			}
		}
		System.out.println(count);
		
		if(count == 0)
		{
			model.addAttribute("address",service.findCenter(resultAddress));
		}

		System.out.println(resultAddress);
		System.out.println(myLocation);
		
		return "mapResult";
	}
	
	@PostMapping(value = "/findcenterWrite.do")
	public String findCenterWrite(String ADDRESS, Model model) 
	{

		System.out.println(ADDRESS); // 내 현재 위치
		
		String resultADDRESS = ADDRESS.substring(0,3).trim(); // 내 현재위치의 넓은 범위 ex) 서울특별시, 경기도
		String myLocation = ADDRESS.split(" ")[1]; // 내 현재위치의 구 or 시 
				
		List<FindCenter_dto> result = service.findCenter(resultADDRESS);
		System.out.println(result.size());
//		String[] findLocation = new String[result.size()];
		
		for(int i=0; i< result.size(); i++) // 내 현재위치의 넓은 범위 구 or 시
		{
			if(!(result.get(i).getADDRESS().split(" ")[1].equals(myLocation)))
			{
				System.out.println(i+"는 안들어감ㅋ");
				continue;		
			}
			else if(result.get(i).getADDRESS().split(" ")[1].equals(myLocation))	
			{
				System.out.println("같다");
				System.out.println(result.get(i).getADDRESS().split(" ")[1]);
				System.out.println(i+"는 들어감ㅋ");
				model.addAttribute("address", service.findCenter2(ADDRESS));		
				break;
			}
		}
			return "mapResult";
	}
}
