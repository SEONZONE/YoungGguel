package com.sist.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.movie.service.ReviewService;
import com.sist.movie.vo.Review;

@RestController
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("movieReview.do")
	public List<Review> findReviewList() {
		return reviewService.findReviewList();
	}
	
	@PostMapping("movieReviewInsert.do")
	public void registerReview(@RequestParam String userId, @RequestParam String comments) {
		reviewService.registerReview(userId, comments);
	}
}
