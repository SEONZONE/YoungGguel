package com.sist.movie.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.UserVO;

@Repository
public class UserDao extends SqlSessionDaoSupport {
   
   @Resource(name="sqlSessionTemplate")
   protected void initDao(SqlSessionTemplate st) throws Exception {
      // TODO Auto-generated method stub
      this.setSqlSessionTemplate(st);
   }
   
   public void insertUser(UserVO vo) {
      this.getSqlSession().insert("insertUser", vo);
   }
   //아이디 비밀번호 체크
   public int idCheck(String id) {
      int p = this.getSqlSession().selectOne("idCheck", id);
      return p;
   }
   
   //일반 사용자 로그인 
   public boolean loginBoard(String id, String password) {
		String dbPass = this.getSqlSession().selectOne("loginBoard", id);
		return dbPass != null && dbPass.equals(password);
	}
   //어드민 로그인
   public boolean adminloginBoard(String id,String verify) {
	   String dbPass = this.getSqlSession().selectOne("adminloginBoard", id);
	   return dbPass != null && dbPass.equals(verify);
   }
}