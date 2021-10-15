package com.sist.movie.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.UserVo;

@Repository
public class UserDao extends SqlSessionDaoSupport {
	
	@Resource(name="sqlSessionTemplate")
	protected void initDao(SqlSessionTemplate st) throws Exception {
		// TODO Auto-generated method stub
		this.setSqlSessionTemplate(st);
	}
	
	public void insertUser(UserVo vo) {
		this.getSqlSession().insert("insertUser", vo);
	}
	
	public String idCheck(String id) {
		String imsi = this.getSqlSession().selectOne(id);
		return imsi;
	}
	
}
