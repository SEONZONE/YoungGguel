package com.sist.movie.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.MovieVO;

@Repository
public class MovieDao extends SqlSessionDaoSupport {
   
   @Autowired
   protected void initDao(SqlSessionTemplate st) throws Exception {
      this.setSqlSessionTemplate(st);
   }
   public List<MovieVO> movieList() {
      return this.getSqlSession().selectList("movieList");
   }
  
   
   public List<MovieVO> currentMovieList() {
	   return this.getSqlSession().selectList("currentMovieList");
   }
   public List<MovieVO> laterMovieList() {
	   return this.getSqlSession().selectList("laterMovieList");
   }
   public MovieVO selectInfoMovie(int no) {
		return this.getSqlSession().selectOne("selectInfoMovie", no);
   }
   public List<MovieVO> searchMovie(String search) {
	   return this.getSqlSession().selectList("searchMovie", search);
   }
   public List<MovieVO> mainPopularList() {   
	   return this.getSqlSession().selectList("mainPopularList");
   }
   public List<MovieVO> mainScheduledList() {
	   return this.getSqlSession().selectList("mainScheduledList");
   }
   public List<MovieVO> mainOnAirList() {   
	   return this.getSqlSession().selectList("mainOnAirList");
   }
   //영화데모테이블 조회
   public List<MovieVO> selcetReserveMovieList(){
	   return this.getSqlSession().selectList("movieDemoList");
   }
   //영화기간별  조회	
   public List<MovieVO> selcetReserveMovieListtest(HashMap<String,Object> map){
	   return this.getSqlSession().selectList("movieDemoListTest",map);
   }
}
