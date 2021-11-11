package com.sist.movie.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.HeartVO;

@Repository
public class HeartDao extends SqlSessionDaoSupport {
	
	@Autowired
	   protected void initDao(SqlSessionTemplate st) throws Exception {
	      this.setSqlSessionTemplate(st);
	   }
	
	public void heartInsert(HeartVO vo) {
		this.getSqlSession().insert("heartInsert", vo);
	}
	
	public List<HeartVO> heartSum() {
		return this.getSqlSession().selectList("heartSum");
	}
	
	public int heartCount(int movieCd) {
		return this.getSqlSession().selectOne("heartCount", movieCd);
	}
	
	public void heartDelete(HeartVO vo) {
		this.getSqlSession().delete("heartDelete", vo);
	}
	
	public List heartFind(String userId) {
		return this.getSqlSession().selectList("heartFind", userId);
	}
}
