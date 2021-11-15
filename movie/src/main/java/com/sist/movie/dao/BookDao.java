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
	
	public List<BookVO> selectLocation(String locName) { 
		return this.getSqlSession().selectList("selectLocation",locName);
	}
	
	// 예매내역 전체 조회 
	public List<BookVO>allListBooking() { 
		return this.getSqlSession().selectList("allListBooking");
	}
	
	// 예매목록 삭제 
	public String bookingDelete(String deleteOne) { 
		 this.getSqlSession().delete("bookingDelete",deleteOne);
		 return "Delete Success";
	}
	//관리자 페이지에서 예매 취소했을경우, 좌석 T에서 F로 변환
	public void updateSeatFalse(HashMap<String, Object> map) {
		this.getSqlSession().update("updateSeatFalse",map);
	}
	

}
