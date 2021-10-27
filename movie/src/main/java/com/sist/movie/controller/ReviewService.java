package com.sist.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.movie.dao.ReviewDao;
import com.sist.movie.vo.Review;

@Service
public class ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	public List<Review> findReviewList() {
		return reviewDao.findReviewList();
	}
	
	public void registerReview(String userId, String comment) {
		//TODO 구현 필요 
		
	}
}
