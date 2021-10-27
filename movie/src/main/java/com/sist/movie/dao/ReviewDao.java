package com.sist.movie.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.Review;

@Repository
public class ReviewDao extends SqlSessionDaoSupport {

	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
	     this.setSqlSessionTemplate(st);
	}
	
	public List<Review> findReviewList() {
		return this.getSqlSession().selectList("findReviewList");
	}
	
	public void registerReview() {
		this.getSqlSession().insert("registerReview");
	}
	
}
