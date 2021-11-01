package com.sist.movie.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.movie.dao.ReviewDao;
import com.sist.movie.vo.ReviewVO;

@RestController
public class ReviewController {

	@Autowired 
	private ReviewDao dao;  
	
    /*리뷰 리스트*/
	@RequestMapping("Review.do")
	public List<ReviewVO> findReviewList(int movieCd) {
		return dao.findReviewList(movieCd);
	}
	
	/*리뷰 등록*/
	@ResponseBody
	@RequestMapping(value="reviewInsert.do")
	public List<ReviewVO> registerReviewList(@RequestParam("userId") String userId, @RequestParam("comments") String comments, @RequestParam("movieCd") Integer movieCd) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("userId", userId);
		param.put("comments", comments);
		param.put("movieCd", movieCd);
		String pattern = "yyyy/MM/dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String registerDate = simpleDateFormat.format(new Date());
		String updateDate = simpleDateFormat.format(new Date());
		param.put("registerDate", registerDate);
		param.put("updateDate", updateDate);
        System.out.println(param);   
        if(dao.reviewCheck(param)) {
        	dao.registerReview(param);	        	
        	return dao.findReviewList(movieCd);
        }else {
        	return null;
        }
	}
	/*리뷰 삭제*/
	@ResponseBody
	@RequestMapping(value="reviewDelete.do")
	public List<ReviewVO> deleteReviewList(@RequestParam("reviewNo") int reviewNo, @RequestParam("movieCd") int movieCd) {
		dao.deleteReview(reviewNo);
		return dao.findReviewList(movieCd);
	}
	/*리뷰 업데이트*/
	@ResponseBody
	@RequestMapping(value="reviewUpdate.do")
	public List<ReviewVO> updateReviewList(ReviewVO rv) {
		System.out.println(rv);
		String comments = rv.getComments();
		int reviewNo = rv.getReviewNo();
		int movieCd = rv.getMovieCd();
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("comments", comments);
		param.put("reviewNo", reviewNo);
		dao.updateReview(param);
		return dao.findReviewList(movieCd);
	}
	
}
