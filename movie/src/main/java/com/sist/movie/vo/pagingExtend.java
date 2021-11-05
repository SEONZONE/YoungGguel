package com.sist.movie.vo;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public class pagingExtend extends PageAction{

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
}
