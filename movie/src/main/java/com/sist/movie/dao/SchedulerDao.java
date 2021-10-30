package com.sist.movie.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.TheaterVO;
import com.sist.movie.vo.MovieVO;

@Repository
public class SchedulerDao extends SqlSessionDaoSupport{

	@Resource(name="sqlSessionTemplate")
	protected void initDao(SqlSessionTemplate st) throws Exception {
		// TODO Auto-generated method stub
		this.setSqlSessionTemplate(st);
	}
	
	public List<MovieVO> selectMovieList(){
		return this.getSqlSession().selectList("selectmovieList");
	}
	public List<TheaterVO> selecttheaterList(String city){
		return this.getSqlSession().selectList("selecttheaterList", city);
	}
	public List selecttheatercity() {
		return this.getSqlSession().selectList("selecttheatercity");
	}
	
}
