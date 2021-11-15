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
			calcLastPage(getTotal(), getCntPerPage());	//마지막 페이지 계산
			calcStartEndPage(getNowPage(), cntPage);	//시작페이지 끝 페이지 계산
			calcStartEnd(getNowPage(), getCntPerPage()); 	//DB에 넣어줄 스타트, 엔드 페이지 
		}
		// 제일 마지막 페이지 계산 (전체 / 한 페이지당 보여줄 페이지)
		public void calcLastPage(int total, int cntPerPage) {
			setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
		}
		// 시작, 끝 페이지 계산	
		
		public void calcStartEndPage(int nowPage, int cntPage) {
			setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
			//마지막 페이지가 끝 페이지 보다 작은 경우? 끝 페이지 = 마지막 페이지
			if (getLastPage() < getEndPage()) {
				setEndPage(getLastPage());
			}
			//시작페이지
			//만약 시작 페이지가 1보다 작으면 끝 페이지 - 페이지 갯수 + 1
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
