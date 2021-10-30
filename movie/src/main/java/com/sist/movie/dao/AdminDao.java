package com.sist.movie.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.AnswerVO;
import com.sist.movie.vo.AskVO;

@Repository
public class AdminDao extends SqlSessionDaoSupport {

	@Resource(name = "sqlSessionTemplate")
	protected void initDao(SqlSessionTemplate st) throws Exception {
		// TODO Auto-generated method stub
		this.setSqlSessionTemplate(st);
	}

	// ���ο��� �亯�Ѱ� ��ȣ�ű��
	public Integer getAdminAskSequence() {
		return this.getSqlSession().selectOne("getAdminAskSequence");
	}
	// �����ڿ��� ���ǳ����� �亯�ޱ�
		public void insertAskAnswer(AskVO vo) {
			System.out.println("insertAskAnswer");
			this.getSqlSession().insert("insertAskAnswer", vo);
		}
	// ���ο��� ���ǳ��� �亯�޸� �亯���� �����ϱ�
	public int updateAskstateAction(int no) {
		return this.getSqlSession().update("updateAskstate",no);
	}

	// ���ο��� ���ǳ��� �о����(��ü ���ǳ���)
	public List<AskVO> selectAskAnswerList() {
		System.out.println("selectAsk");
		return this.getSqlSession().selectList("AskAnswerList");
	}

	// ���ο��� ���ǳ��� �о���̱�(������ �۸� ���ǳ������븸)
	public List<AskVO> readslecectedAskAction(HashMap<String,Object> map) {
		return this.getSqlSession().selectList("readselecectedAsk",map);
	}
	//���ο��� ��ȭ���� �ֱ�
	public void insertMovieAction(HashMap<String,Object> map){
		this.getSqlSession().insert("asd",map);
	}

	
}
