package com.sist.movie.vo;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PageAction {
	private int totalRow=10;     //총 데이터 갯수
	   private int pageScale=3;   //한 화면에 출력될 로우
	   private int totalPage=6;    //총 페이지 갯수
	   private int currentPage =3;   //화면이 켜졋을 떄 현재페이징
	   private int currentBlock = 1;            //현재 페이지가 몇번쨰 블럭에잇나                   
	   private int startPage =0;   		///페이징의 첫 값 0으로하면 존재 x 이건 무조건 1
	   private int endPage; //마지막페이지
	   private int start;		//열린페이제어 보여줄 첫번쨰 로우네요
	   private int end;			
	   public void pageProcess(HttpServletRequest request,HashMap<String, Object>map) {
		      try {
		         currentPage=Integer.parseInt(request.getParameter("page"));
		         //�럹�씠吏��뿉 �엲�뒗 媛믪쓣 
		      } catch (Exception e) {
		         // TODO: handle exception
		      }
		      totalRow=MemberDao.getMyBatisDao().getTotalRow(map);
		      totalPage=totalRow%pageScale==0?(totalRow/pageScale):(totalRow/pageScale)+1;
		      start=1+(currentPage-1)*pageScale; 
		      end=pageScale+(currentPage-1)*pageScale;  
		      
		      currentBlock=currentPage%pageScale==0?(currentPage/pageScale):(currentPage/pageScale)+1;
		      startPage=1+(currentBlock-1)*pageScale;
		      endPage=pageScale+(currentBlock-1)*pageScale;
		      if(endPage>=totalPage)endPage=totalPage;
		   }
	
	
	
}