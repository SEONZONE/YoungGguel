package com.sist.movie.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.BookVO;
import com.sist.movie.vo.MovieVO;

@Repository
public class BookDao extends SqlSessionDaoSupport{

	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}

	public List<BookVO> movieSelectAction() {
		return this.getSqlSession().selectList("movieSelectAction");
	}
}
