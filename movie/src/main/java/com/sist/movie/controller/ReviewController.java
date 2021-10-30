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

	/*@Autowired
	private ReviewService reviewService;*/

	@Autowired 
	private ReviewDao dao;  

	@RequestMapping("Review.do")
	public List<ReviewVO> findReviewList(int movieCd) {
		return dao.findReviewList(movieCd);
	}
	
	@ResponseBody
	@RequestMapping(value="reviewInsert.do")
	public List<ReviewVO> registerReviewList(@RequestParam("userId") String userId, @RequestParam("comments") String comments, @RequestParam("movieCd") Integer movieCd) {
		HashMap<String, Object> param = new HashMap<>();
		param.put("userId", userId);
		param.put("comments", comments);
		param.put("movieCd", movieCd);
		String pattern = "yyyy/MM/dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String registerDate = simpleDateFormat.format(new Date());
		String updateDate = simpleDateFormat.format(new Date());
		param.put("registerDate", registerDate);
		param.put("updateDate", updateDate);
		//System.out.println(param.get("movieCd"));
        System.out.println(param);
		dao.registerReview(param);	
		
		return dao.findReviewList(movieCd);
	}
	
	@ResponseBody
	@RequestMapping(value="reviewDelete.do")
	public List<ReviewVO> deleteReviewList(@RequestParam("reviewNo") int reviewNo, @RequestParam("movieCd") int movieCd) {
		System.out.println(reviewNo);
		System.out.println(movieCd);
		dao.deleteReview(reviewNo);
		return dao.findReviewList(movieCd);
	}
	

	
}
