package com.sist.paging;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
public class PagingVO {
	
//	nowPage 현재페이지, 
//	startPage 시작페이지, 
//	endPage 끝페이지, 
//	total 게시글 총 갯수, 
//	cntPerPage 페이지당 글 갯수, 
//	lastPage 마지막페이지, 
//	SQL쿼리에 쓸 start, end
		private int nowPage; 
		private int startPage;
		private int endPage; 
		private int total; 
		private int cntPerPage; 
		private int lastPage;  
		private int start;  
		private int end;
		private int cntPage = 7;
		
		public PagingVO() {
		}
		public PagingVO(int total, int nowPage, int cntPerPage) {
			setNowPage(nowPage); //현재 페이지를 nowPage
			setCntPerPage(cntPerPage);	//페이지당 글 갯수를 설정
			setTotal(total);
			calcLastPage(getTotal(), getCntPerPage());
			calcStartEndPage(getNowPage(), cntPage);
			calcStartEnd(getNowPage(), getCntPerPage());
		}
		// 제일 마지막 페이지 계산
		public void calcLastPage(int total, int cntPerPage) {
			setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
		}
		// 시작, 끝 페이지 계산
		public void calcStartEndPage(int nowPage, int cntPage) {
			setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
			if (getLastPage() < getEndPage()) {
				setEndPage(getLastPage());
			}
			setStartPage(getEndPage() - cntPage + 1);
			if (getStartPage() < 1) {
				setStartPage(1);
			}
		}
		// DB 쿼리에서 사용할 start, end값 계산
		public void calcStartEnd(int nowPage, int cntPerPage) {
			setEnd(nowPage * cntPerPage);
			setStart(getEnd() - cntPerPage + 1);
			setStartPage(1);
		}
		
		

}
