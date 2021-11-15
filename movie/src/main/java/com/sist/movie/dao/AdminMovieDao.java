package com.sist.movie.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.MovieVO;

@Repository
public class AdminMovieDao extends SqlSessionDaoSupport {

	@Resource(name = "sqlSessionTemplate")
	protected void initDao(SqlSessionTemplate st) throws Exception {
		// TODO Auto-generated method stub
		this.setSqlSessionTemplate(st);
	}
	//전체 영화 조회
	public List<MovieVO> selectAllMovie() {
		return this.getSqlSession().selectList("selectAllMovie");
	}
	//영화 삭제
	public void deleteMovie(int movieCd) {
		this.getSqlSession().delete("deleteMovie", movieCd);
	}
	//영화 정보 업데이트(수정)
	public void updateMovie(MovieVO vo) {
		this.getSqlSession().update("updateMovie",vo);
	}
	//영화 테이블에 정보 넣기(인서트)
	public void insertMovie(HashMap<String, Object> map) {
		System.out.println(map);
		this.getSqlSession().insert("insertMovie",map);
	}
}
