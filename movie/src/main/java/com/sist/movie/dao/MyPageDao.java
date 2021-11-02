package com.sist.movie.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.AnswerVO;
import com.sist.movie.vo.AskVO;
import com.sist.movie.vo.BookingDemoVO;
import com.sist.movie.vo.MovieDemoVO;
import com.sist.movie.vo.UserVO;


@Repository
public class MyPageDao extends SqlSessionDaoSupport {
	
	
	@Resource(name="sqlSessionTemplate")
	protected void initDao(SqlSessionTemplate st) throws Exception {
		// TODO Auto-generated method stub
		this.setSqlSessionTemplate(st);
	}
	//�������������� �����ϱ� ��ȣ��������!
	public Integer getAskSequence() {
		return this.getSqlSession().selectOne("getAskSequence");
	}
//�Ʒ� �޼ҵ带 ���������� ���õ� �ŷ� �ٲ�ߴ�
	public void insertQuery(UserVO vo) {
		this.getSqlSession().insert("insertQuery", vo);
	}
	public void renewMyPage(MovieDemoVO vo) {
		this.getSqlSession().selectList("renewMypage", vo);
	}
	//�������������� �����ϱ� ������
	public void uploadAsk(AskVO vo) {
		this.getSqlSession().insert("uploadAsk",vo);
	}
	//������������ ���ǳ��� ��������(id������) �Ⱦ��µ�?
	public List<AskVO> selectAsk(String id){
		return this.getSqlSession().selectList("selectAsk",id);
	}
	
	public List<UserVO> getUserInfo(String id) {
		return this.getSqlSession().selectList("getUserInfo",id);
	}
	
	
}
