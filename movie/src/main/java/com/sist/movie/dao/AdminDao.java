package com.sist.movie.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sist.movie.vo.AnswerVO;
import com.sist.movie.vo.AskVO;
import com.sist.movie.vo.MovieVO;
import com.sist.movie.vo.ProductVO;
import com.sist.movie.vo.UserVO;

@Repository
public class AdminDao extends SqlSessionDaoSupport {

	@Resource(name = "sqlSessionTemplate")
	protected void initDao(SqlSessionTemplate st) throws Exception {
		// TODO Auto-generated method stub
		this.setSqlSessionTemplate(st);
	}
	//모든 유저 정보 조회
	public List<UserVO> selectAllUser() {
		return this.getSqlSession().selectList("AdminSelectAllUser");
	}
	//선택한 유저 1명 분만 정보 조회
	public List<UserVO> selectOneUser(String userId) {
		System.out.println(this.getSqlSession().selectList("selectOneUser",userId));
		return this.getSqlSession().selectList("selectOneUser",userId);
	}
	//유저 Id로 검색하기
	public List<UserVO> SearchUserID(String userId){
		return this.getSqlSession().selectList("SearchUserID",userId);
	}
	//선택한 유저 삭제
	public void deleteUser(String userId) {
		this.getSqlSession().delete("AdmindeleteUser",userId);
	}
	//전체 영화 조회
	public List<MovieVO> selectAllMovie() {
		return this.getSqlSession().selectList("SelectAllMovie");
	}
	//영화 정보 업데이트(수정)
	public void updateMovie(MovieVO vo) {
		this.getSqlSession().update("updateMovie",vo);
	}
	//전체 제품 조회
	public List<ProductVO> selectAllProduct() {
		return this.getSqlSession().selectList("SelectAllProduct");
	}
	//영화 테이블에 정보 넣기(인서트)
	public void movieInsertAction(MovieVO vo) {
		this.getSqlSession().insert("insertMovie_info",vo);
	}
	//유저 정보 변경(업데이트)
	public void updateUser(HashMap<String,Object> map) {
		this.getSqlSession().update("AdminupdateUser",map);
	}
	// 占쏙옙占싸울옙占쏙옙 占썰변占싼곤옙 占쏙옙호占신깍옙占�
	public Integer getAdminAskSequence() {
		return this.getSqlSession().selectOne("getAdminAskSequence");
	}
	// 占쏙옙占쏙옙占쌘울옙占쏙옙 占쏙옙占실놂옙占쏙옙占쏙옙 占썰변占쌨깍옙
		public void insertAskAnswer(AskVO vo) {
			System.out.println("insertAskAnswer");
			this.getSqlSession().insert("insertAskAnswer", vo);
		}
	// 占쏙옙占싸울옙占쏙옙 占쏙옙占실놂옙占쏙옙 占썰변占쌨몌옙 占썰변占쏙옙占쏙옙 占쏙옙占쏙옙占싹깍옙
	public int updateAskstateAction(int no) {
		return this.getSqlSession().update("updateAskstate", no);
	}

	// 占쏙옙占싸울옙占쏙옙 占쏙옙占실놂옙占쏙옙 占싻억옙占쏙옙占�(占쏙옙체 占쏙옙占실놂옙占쏙옙)
	public List<AskVO> selectAskAnswerList() {
		System.out.println("selectAsk");
		return this.getSqlSession().selectList("AskAnswerList");
	}

	// 占쏙옙占싸울옙占쏙옙 占쏙옙占실놂옙占쏙옙 占싻억옙占쏙옙堅占�(占쏙옙占쏙옙占쏙옙 占쌜몌옙 占쏙옙占실놂옙占쏙옙占쏙옙占쎈만)
	public List<AskVO> readslecectedAskAction(HashMap<String,Object> map) {
		return this.getSqlSession().selectList("readselecectedAsk",map);
	}
	//占쏙옙占싸울옙占쏙옙 占쏙옙화占쏙옙占쏙옙 占쌍깍옙
	public void insertMovieAction(HashMap<String,Object> map){
		this.getSqlSession().insert("asd",map);
	}

}