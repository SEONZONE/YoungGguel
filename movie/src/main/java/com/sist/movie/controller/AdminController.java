package com.sist.movie.controller;

import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sist.movie.dao.AdminDao;
import com.sist.movie.dao.MovieDao;
import com.sist.movie.dao.MyPageDao;
import com.sist.movie.dao.UserDao;
import com.sist.movie.vo.ActorVO;
import com.sist.movie.vo.AnswerVO;
import com.sist.movie.vo.AskVO;
import com.sist.movie.vo.BookingDemoVO;
import com.sist.movie.vo.MovieVO;

@Controller
public class AdminController {

	@Autowired
	private MovieDao dao;
	@Inject
	private AdminDao Adao;

//	@RequestMapping(value="insert_movie.do")
//	public String insertMovie(MovieVO vo) {
//		
//		vo.setMovieCd(vo.getMovieCd());
//		vo.setMovieNm(vo.getMovieNm());
//		vo.setMovieNmEn(vo.getMovieNmEn());
//		vo.setShowTm(vo.getShowTm());
//		vo.setOpenDt(vo.getOpenDt());
//		vo.setContents(vo.getContents());
//		vo.setPrdtStatNm(vo.getPrdtStatNm());
//		vo.setNations(vo.getNations());
//		vo.setGenre(vo.getGenre());
//		vo.setDirectors(vo.getDirectors());
//		vo.setActors(vo.getActors());
//		vo.setWatchGradeNm(vo.getWatchGradeNm());
//		vo.setCompanys(vo.getCompanys());
//		
//		System.out.println(vo);
//		dao.insertMovie_Info(vo);
//		
//		return "view/jsp/Admin/insertMovie";
//	}
//	//��ȭ��� �ֱ�
//		@RequestMapping(value="insert_actor.do")
//	public String insertActor(ActorVO bean) {
//
//		 bean.setActor_name(bean.getActor_name());
//		
//		dao.insertActor(bean);
//		
//		return "view/jsp/Admin/insertActor";
//	}
//		//��ȭ ���� ����
//		@RequestMapping(value="deleteMovie.do")
//		public String deleteMovie(ActorVO bean) {
//			
//			bean.setActor_name(bean.getActor_name());
//			
//			dao.insertActor(bean);
//			
//			return "view/jsp/Admin/deleteActor";
//		}
//		//��ȭ ���� ����
//		@RequestMapping(value="updateMovie.do")
//		public String updateMovie(ActorVO bean) {
//			
//			bean.setActor_name(bean.getActor_name());
//			
//			dao.insertActor(bean);
//			
//			return "view/jsp/Admin/updateActor";
//		}
		@RequestMapping(value="selectMovielist.do")
		public String selectMovielistAction(HashMap<String,Object> map) {
			map.put("moviesList",dao.selcetReserveMovieList());
			
			return "view/jsp/Admin/selectMovie";
		}
		//�ϴ� ���ο��� ���ǳ��� �о����
		@ResponseBody
		@RequestMapping(value="selectAskAnswerList.do")
		public List<AskVO> AnswerListAction() {
			return Adao.selectAskAnswerList();
		}
		//���ο��� ������ ���ǳ����� �о����
		@RequestMapping(value="AnswerList.do")
		public String askListAction(HashMap<String,Object> map,String user_id,int ask_no,Model model) {
			map.put("user_id",user_id);
			map.put("ask_no",ask_no);
			model.addAttribute("AskListItem",Adao.readslecectedAskAction(map));
			return "view/jsp/Admin/AnswerAsk";
			}
		
		//�����ڿ��� ���ǳ��� �亯�ޱ�
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
				
				//�ϴ� ���α� �ۼ��Ҷ� SEQ�����ؼ� no�� �־��ְ�
				//�� ������
			
			
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
					  map.put("no",bean.getJob()); //�ʿ������ map.put("pnum",bean.getPnum());
					 
				
				System.out.println(bean);
				

				Adao.insertAskAnswer(bean);//no�� Ÿ��Ʋ�̶� ������
				//Adao.updateAskstateAction(bean.getAsk_no());
				//�̰� �ٷ� ������ ���ڿ� ASK_NO�־�ߵǰ�
//				�׷��� ������ @PARAM���� ���� NO��������ǵ��� �����غ���
				return "redirect:/view/jsp/Admin/askadmin.jsp";
			}
}
