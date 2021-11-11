package com.sist.paging;

import lombok.Data;

@Data
public class Paging {
	
	/*
	 * rows: 현재 보여질 row 수
	 * page : 현재 보여질 페이지 수
	 * totalPage : 총 페이지 수
	 * startPage : 시작 페이지 수
	 * endPage : 끝 페이지 수
	 * pageScale : 한 페이지에 보여질 페이지 수
	 */
	private int rows=2;
	private int page=1;
	private int totalPage;
	private int startPage=1;
	private int endPage;
	private int pageScale=3;
			

}