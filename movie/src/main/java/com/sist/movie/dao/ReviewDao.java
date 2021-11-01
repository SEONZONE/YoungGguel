package com.sist.movie.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.ReviewVO;

@Repository
public class ReviewDao extends SqlSessionDaoSupport {

	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
	     this.setSqlSessionTemplate(st);
	}
	
	public List<ReviewVO> findReviewList(Integer movieCd) {
		return this.getSqlSession().selectList("findReviewList", movieCd);
	}	
	public boolean reviewCheck(HashMap<String, Object> param) {
		if(this.getSqlSession().selectOne("reviewCheck",param)!=null) {
			return false;
		}return true;
	}
	public void registerReview(HashMap<String, Object> param) {
		this.getSqlSession().insert("registerReview",param);
	}
	public void deleteReview(int reviewNo) {
		this.getSqlSession().delete("deleteReview",reviewNo);
	}
	public void updateReview(HashMap<String, Object> param) {
		this.getSqlSession().update("updateReview",param);
	}
	


}
