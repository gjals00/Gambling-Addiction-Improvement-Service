package com.myproject.mypj.vo;

import com.myproject.mypj.dao.Paging_dao;

public class Paging_dto {

	Paging_dao pagingDao = new Paging_dao();

	private static final int page = 1; //현재 페이지 (get)
//	private int pageNumber // 페이지 넘버
	private int allPage;
	private int firstPage;  //첫번째 페이지
	private int lastPage;    //마지막 페이지
//	private static final int displayRow =10;  //한 페이지에 몇 개의 로우 (선택 set)
//	private static final int nowPage =10;  //한 페이지에 몇 개의 페이지 (선택 set)
	
	
	public int allPage()
	{
		return pagingDao.count();
	}
	
	public int firstPage(int pageNumber)
	{
		return ((pageNumber - 1) * 10 + 1);
	}
	
//	public int lastPage(int pageNumber)
//	{
//		int result = pageNumber * 10;
//		
//		if(allPage() >= result && allPage()%result != 0)
//		{
//			return result;
//		}
//		else
//		{
//			return allPage();
//		}
//	}
	
	public int lastPage(int pageNumber)
	{
		int result = pageNumber * 10;
		
		return result;
	}
//	public int getPageNumber() {
//		return pageNumber;
//	}
//	public void setPageNumber(int pageNumber) {
//		this.pageNumber = pageNumber;
//	}
	public int getAllPage() {
		return allPage;
	}
	public void setAllPage(int allPage) {
		this.allPage = allPage;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}	
}
