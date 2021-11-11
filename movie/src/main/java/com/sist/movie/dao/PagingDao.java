package com.sist.movie.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.paging.PagingVO;
@Repository
public class PagingDao extends SqlSessionDaoSupport{
	
	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}
	
	public int countBoard() {
		return this.getSqlSession().selectOne("countUser");
	}
	
	public List<PagingVO> selectBoard(PagingVO vo) {
		return this.getSqlSession().selectList("selectUserBoard",vo);
	}
}
