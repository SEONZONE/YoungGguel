package com.sist.movie.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.TheaterVO;

@Repository
public class TheaterDao extends SqlSessionDaoSupport {
	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}

	public List<TheaterVO> theaterCity() {
		System.out.println("THEATERLIST!!!!!");
		return this.getSqlSession().selectList("theaterCity");
	}
	public List<TheaterVO> theaterTown() {
		System.out.println("theaterTown!!!!!");
		return this.getSqlSession().selectList("theaterTown");
	}
}
