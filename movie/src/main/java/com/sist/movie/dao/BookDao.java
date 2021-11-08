package com.sist.movie.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.BookVO;
import com.sist.movie.vo.MovieVO;
import com.sist.movie.vo.UserVO;

@Repository
public class BookDao extends SqlSessionDaoSupport {

	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}

	public List<BookVO> movieSelectAction(HashMap<String, Object> map) {
		return this.getSqlSession().selectList("movieSelectAction", map);
	}

	public List<BookVO> seatSelectAction(HashMap<String, Object> map) {
		return this.getSqlSession().selectList("seatSelectAction", map);
	}

	public void insertBooking(BookVO vo) {
		this.getSqlSession().insert("insertBooking", vo);
	}

	public void updateSeat(HashMap<String, Object> map) {
		this.getSqlSession().update("updateSeat",map);
	}

}
