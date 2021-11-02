package com.sist.movie.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.ProductVO;
import com.sist.movie.vo.UserVO;

@Repository
public class StoreDao extends SqlSessionDaoSupport {
	
	@Inject
	protected void initDao(SqlSessionTemplate st) throws Exception {
		// TODO Auto-generated method stub
		this.setSqlSessionTemplate(st);
	}
	/* ����� �α�� ����Ʈ */
	public List<ProductVO> selectProductList(){
		return this.getSqlSession().selectList("selectProductList");
	}
	/* ����� ���� Ƽ�� ����Ʈ */
	public List<ProductVO> selectTicketProductList(){
		return this.getSqlSession().selectList("selectTicketProductList");
	}
	/* ����� ���� ���� ����Ʈ */
	public List<ProductVO> selectGoodsProductList(){
		return this.getSqlSession().selectList("selectGoodsProductList");
	}
	/* ����� ������ ������ */
	public ProductVO selectProductDetail(int no){
		return this.getSqlSession().selectOne("selectProductDetail", no);
	}
	
	
}
