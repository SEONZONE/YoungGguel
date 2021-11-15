package com.sist.movie.controller;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sist.movie.dao.AdminDao;
import com.sist.movie.dao.BookDao;
import com.sist.movie.dao.MovieDao;
import com.sist.movie.dao.MyPageDao;
import com.sist.movie.dao.UserDao;
import com.sist.movie.vo.ActorVO;
import com.sist.movie.vo.AnswerVO;
import com.sist.movie.vo.AskVO;
import com.sist.movie.vo.BookVO;
import com.sist.movie.vo.BookingDemoVO;
import com.sist.movie.vo.MovieVO;
import com.sist.movie.vo.UserVO;

@Controller
public class AdminController {

	@Autowired
	private MovieDao dao;
	@Inject
	private AdminDao Adao;
	   //성종 예매내역 조회
	   @Inject
	   private BookDao bDao;
	   
	//유저 전체 리스트 가져오기
	@RequestMapping(value="admin/selectAllUser.do")
	public String selectUserList(HashMap<String,Object> map) {
		map.put("AllUserList", Adao.selectAllUser());
		return "view/jsp/Admin/AdminUserPage";
	}
	//유저 한명만 가져오기
	@RequestMapping(value="admin/selectOneUser.do")
	@ResponseBody
	public List<UserVO> selectOneUserInfo(Model model,String userId) {
		model.addAttribute("OneUserInfo", Adao.selectOneUser(userId));
		return Adao.selectOneUser(userId);
	}
	//유저 정보 변경
	@ResponseBody
	@RequestMapping(value="admin/UpdateUser.do")
	//public String UpdateUserAction(HashMap<String, Object> map) {
	public String UpdateUserAction(String UID,String UPW,String UTEL,String UNAME,String UEMAIL,String UBIRTH,String UGENDER) {
		System.out.println(UID + " "  +UPW + " "  +  UTEL + " "  +  UNAME + " "  +  UEMAIL+ " "  +   UBIRTH+ " "  + UGENDER);
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("USERID", UID);
		map.put("USERPW", UPW);
		map.put("USERTEL", UTEL);
		map.put("USERNAME", UNAME);
		map.put("USERBIRTH", UBIRTH);
		map.put("USEREMAIL", UEMAIL);
		map.put("USERGENDER", UGENDER);
		
		Adao.updateUser(map);
		return "view/jsp/Admin/AdminUserPage";
	}

	//유저 ID로 검색하기
	@ResponseBody
	@RequestMapping(value="admin/SearchUserId.do")
	public List<UserVO> SearchIDAction(String userId) {
		System.out.println(userId);
		System.out.println(Adao.SearchUserID(userId));
		return Adao.SearchUserID(userId);
	}
	//유저 삭제하기
	@RequestMapping(value="admin/deleteUser.do")
	public String DeleteUserAction(String userId) {
		Adao.deleteUser(userId);
		System.out.println("삭제성공");
		return "view/jsp/Admin/AdminUserPage";
	}
	//전체 영화 조회
	@RequestMapping(value="SelectAllMovie.do")
	public String SelectAllMovieAction(HashMap<String,Object> map) {
		map.put("AllMovieList", Adao.selectAllMovie());
		return "view/jsp/Admin/AdminMoviePage";
	}
	//영화 정보 수정
	@RequestMapping(value="admin/UpdateMovie.do")
	public String UpdateMovieAction(HashMap<String,Object> map,MovieVO vo,String movieNo) {
		vo.setMovieNm(movieNo);
		vo.setMovieNmEn(vo.getMovieNmEn());
		vo.setShowTm(vo.getShowTm());
		vo.setOpenDt(vo.getOpenDt());
		vo.setEndDt(vo.getEndDt());
		vo.setContents(vo.getContents());
		vo.setPrdtStatNm(vo.getPrdtStatNm());
		vo.setNations(vo.getNations());
		vo.setGenre(vo.getGenre());
		vo.setDirectors(vo.getDirectors());
		vo.setActors(vo.getActors());
		vo.setWatchGradeNm(vo.getWatchGradeNm());
		vo.setCompanys(vo.getCompanys());
		System.out.println(vo);
		Adao.updateMovie(vo);
		return "view/jsp/Admin/AdminMoviePage";
	}
	//전체 스토어제품 조회
	@RequestMapping(value="SelectAllProduct.do")
	public String SelectAllStoreAction(HashMap<String,Object> map) {
		map.put("AllProductList", Adao.selectAllProduct());
		return "view/jsp/Admin/AdminStorePage";
	}
	//어드민에서 영화정보 넣기
	@RequestMapping(value="insertMovie.do")
	public String InsertMovieAction(MovieVO vo) {
		//vo.setMovieCd(vo.getMovieCd());
		vo.setMovieNm(vo.getMovieNm());
		vo.setMovieNmEn(vo.getMovieNmEn());
		vo.setShowTm(vo.getShowTm());
		vo.setOpenDt(vo.getOpenDt());
		vo.setEndDt(vo.getEndDt());
		vo.setContents(vo.getContents());
		vo.setPrdtStatNm(vo.getPrdtStatNm());
		vo.setNations(vo.getNations());
		vo.setGenre(vo.getGenre());
		vo.setDirectors(vo.getDirectors());
		vo.setActors(vo.getActors());
		vo.setWatchGradeNm(vo.getWatchGradeNm());
		vo.setCompanys(vo.getCompanys());
		System.out.println(vo);
		Adao.movieInsertAction(vo);
		return "view/jsp/Admin/AdminMoviePage";
	}

	
		@RequestMapping(value="selectMovielist.do")
		public String selectMovielistAction(HashMap<String,Object> map) {
			map.put("moviesList",dao.selcetReserveMovieList());
			
			return "view/jsp/Admin/selectMovie";
		}
		//占싹댐옙 占쏙옙占싸울옙占쏙옙 占쏙옙占실놂옙占쏙옙 占싻억옙占쏙옙占�
		@ResponseBody
		@RequestMapping(value="selectAskAnswerList.do")
		public List<AskVO> AnswerListAction() {
			return Adao.selectAskAnswerList();
		}
		//占쏙옙占싸울옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占실놂옙占쏙옙占쏙옙 占싻억옙占쏙옙占�
		@RequestMapping(value="AnswerList.do")
		public String askListAction(HashMap<String,Object> map,String user_id,int ask_no,Model model) {
			map.put("user_id",user_id);
			map.put("ask_no",ask_no);
			model.addAttribute("AskListItem",Adao.readslecectedAskAction(map));
			return "view/jsp/Admin/AnswerAsk";
			}
		
		//占쏙옙占쏙옙占쌘울옙占쏙옙 占쏙옙占실놂옙占쏙옙 占썰변占쌨깍옙
		@RequestMapping(value="insertAskAnswer.do")
		public String InsertAskAnswerAction(AskVO bean, @RequestParam(value="file", required=false) MultipartFile file) {
			String location = "C:\\Users\\izp10\\Desktop\\Spring\\movie\\src\\main\\webapp\\resources\\FromAdminToUser\\";
			FileOutputStream fos = null;
			String fileName = file.getOriginalFilename();
			if (fileName.length() > 0) {
				try {
					fos = new FileOutputStream(location.concat(fileName));
					fos.write(file.getBytes());
					bean.setAsk_fileName(fileName);
				} catch (Exception e) {
					// TODO: handle exception e.printStackTrace();
					e.printStackTrace();
				} finally {
					try {
						if (fos != null)fos.close();
					} catch (Exception e2) {
						// TODO: handle exception
						e2.printStackTrace();
					}
				}
			}else {
				bean.setAsk_fileName("noData");
			}
				
				//占싹댐옙 占쏙옙占싸깍옙 占쌜쇽옙占쌀띰옙 SEQ占쏙옙占쏙옙占쌔쇽옙 no占쏙옙 占쌍억옙占쌍곤옙
				//占쏙옙 占쏙옙占쏙옙占쏙옙
			
			
				//if(bean.getJob().equals("answer")) {
					bean.setAsk_no(Adao.getAdminAskSequence());
					bean.setAsk_title(bean.getAsk_title());
					bean.setAsk_contents(bean.getAsk_contents());
					bean.setUser_id(bean.getUser_id());
					bean.setPnum(bean.getPnum());
					bean.setRef(bean.getRef());
					bean.setUser_id(bean.getUser_id());
					bean.setAnswer_ck(bean.getAnswer_ck());
					
					  HashMap<String,Object>map =new HashMap<String,Object>();
					  map.put("no",bean.getJob()); //占십울옙占쏙옙占쏙옙占� map.put("pnum",bean.getPnum());
					 
				
				System.out.println(bean);
				

				Adao.insertAskAnswer(bean);//no占쏙옙 타占쏙옙틀占싱띰옙 占쏙옙占쏙옙占쏙옙
				//Adao.updateAskstateAction(bean.getAsk_no());
				//占싱곤옙 占쌕뤄옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쌘울옙 ASK_NO占쌍억옙森품占�
//				占쌓뤄옙占쏙옙 占쏙옙占쏙옙占쏙옙 @PARAM占쏙옙占쏙옙 占쏙옙占쏙옙 NO占쏙옙占쏙옙占쏙옙占쏙옙풩占쏙옙占� 占쏙옙占쏙옙占쌔븝옙占쏙옙
				return "redirect:/view/jsp/Admin/askadmin.jsp";
			}


 




	/* 성종 예매관리 */

	//전체 리스트 출력
	@PostMapping(value = "allList.do")
	@ResponseBody
	public List<BookVO> allListBooking(String allSelect) {
		return bDao.allListBooking();
	}

	//예매목록 삭제 
	@PostMapping(value = "deletList.do")
	@ResponseBody
	public String bookingDelete(String deleteOne, String deleteSeat1, String deleteSeat2, String deleteSeatNo) {
		HashMap<String, Object> bookingDeleteMap = new HashMap<String, Object>();
		System.out.println("deleteOne: " + deleteOne + "\n deleteSeatNo: " + deleteSeatNo + "\n deleteSeat1:" + deleteSeat1 + "\n deleteSeat2:" + deleteSeat2);
		if(deleteSeat2 == null ) { 
			bookingDeleteMap.put("deleteSeat2", deleteSeat2);
			bookingDeleteMap.put("deleteSeat1", deleteSeat1);
		}
		else { 
			bookingDeleteMap.put("deleteSeat2", "no");
			bookingDeleteMap.put("deleteSeat1", deleteSeat1);
		}
	
		bookingDeleteMap.put("deleteSeatNo", deleteSeatNo);
		bookingDeleteMap.put("deleteOne", deleteOne);
		
		System.out.println(bookingDeleteMap);
		bDao.updateSeatFalse(bookingDeleteMap);
		bDao.bookingDelete(deleteOne);
		return "삭제성공";
	}

}

