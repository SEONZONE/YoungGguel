package com.sist.movie.dao;

import java.util.HashMap;

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
      System.out.println(vo);
   }
   //�븘�씠�뵒 鍮꾨�踰덊샇 泥댄겕
   public int idCheck(String id) {
      int p = this.getSqlSession().selectOne("idCheck", id);
      return p;
   }
   
   //�씪諛� �궗�슜�옄 濡쒓렇�씤 
   public boolean loginBoard(String id, String password) {
		String dbPass = this.getSqlSession().selectOne("loginBoard", id);
		return dbPass != null && dbPass.equals(password);
	}
   //�뼱�뱶誘� 濡쒓렇�씤
   public boolean adminloginBoard(String id,String verify) {
	   String dbPass = this.getSqlSession().selectOne("adminloginBoard", id);
	   return dbPass != null && dbPass.equals(verify);
   }
 //인효 부분
 	public void updateUser(String id) {
 		this.getSqlSession().update("updateUser",id);
 	}
 	public String getPassword(String id) {
 		return this.getSqlSession().selectOne("getPassword",id);
 	}
 	//아디 찾아오기
 	public String getUserId(String id) {
 		return this.getSqlSession().selectOne("getUserId",id);
 	}
 	//계정 삭제 아디
 	public void deleteUser(String id) {
 		System.out.println(id);
 		this.getSqlSession().delete("deleteUser",id);
 	}
 	//아이디 비밀번호 변경
 	public void renewPWAction(HashMap<String,Object> map) {
 		System.out.println(map);
 		this.getSqlSession().update("renewPassword",map);
 		System.out.println("변경성공");
 	}
 	////인효 부분끝
 	
}