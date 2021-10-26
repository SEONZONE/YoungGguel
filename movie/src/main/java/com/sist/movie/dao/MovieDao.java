package com.sist.movie.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MovieDao extends SqlSessionDaoSupport {
	@Resource(name = "sqlSessionTemplate")
	protected void initDao(SqlSessionTemplate st) throws Exception {
		// TODO Auto-generated method stub
		this.setSqlSessionTemplate(st);
	}

	/*
	 * public List<""> selectAjaxReply() { return
	 * this.getSqlSession().selectList("selectMovies"); }
	 */

}
