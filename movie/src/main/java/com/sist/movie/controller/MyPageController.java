package com.sist.movie.controller;

import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sist.movie.dao.MovieDao;
import com.sist.movie.dao.MyPageDao;
import com.sist.movie.dao.UserDao;
import com.sist.movie.vo.AskVO;
import com.sist.movie.vo.UserVO;


@Controller
public class MyPageController{
	@Autowired
	private MyPageDao dao;
	@Inject
	private UserDao userdao;
	@Inject
	private MovieDao mdao;

	// �����ϱ� ������ �ִ°�
	@PostMapping(value = "ask.do")
	public String uploadAskAction(AskVO bean, @RequestParam(value="file", required=false, defaultValue = "noData") MultipartFile file) {
	String location = "C:\\Users\\izp10\\Desktop\\Spring\\movie\\src\\main\\webapp\\resources\\upload\\";
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
	if(bean.getJob().equals("ask")) {
		bean.setAsk_no(dao.getAskSequence());
		bean.setAsk_title(bean.getAsk_title());
		bean.setPnum(bean.getAsk_no());
		bean.setRef(bean.getAsk_no());
		bean.setAsk_contents(bean.getAsk_contents());
		bean.setUser_id(bean.getUser_id());
		bean.setAnswer_ck(bean.getAnswer_ck());
	}
		System.out.println(bean);
		dao.uploadAsk(bean);
		
		return "redirect:/view/jsp/myPage2.jsp";
	}
	@RequestMapping(value = "mypage2.do")
	public String myPage2Action(Model model) {
		return "view/jsp/myPage2";
	}
	@ResponseBody
	@RequestMapping(value = "selectAsk.do")
	public List<AskVO> selectAskAction(String id) {
		System.out.println(id);
		return dao.selectAsk(id);
	}
	@RequestMapping(value ="mypage3.do")
	public String myPage3Action(Model model, String id) {
		model.addAttribute("user_info",dao.getUserInfo(id));
		return "view/jsp/Admin/myPage3";
	}
	@RequestMapping(value="deleteUser.do")
	public String deleteUserAction(String id) {
		//HashMap<String,Object> map=new HashMap<String,Object>();
		System.out.println(id+" "+"����");
		userdao.deleteUser(id);
		
//		System.out.println("success");
		
		return "/view/jsp/Admin/deleteUser";
			
	}
	//�н����� ����//
	@RequestMapping(value="RenewPassword.do")
	public String renewPassword(String userPw,String userId) {
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("userId",userId);
		map.put("userPw",userPw);
		userdao.renewPWAction(map);
		System.out.println("PW번호변경 성공");	
		return "view/jsp/myPage1";
	}
	//�������������� ��ȭ����Ʈ �ҷ�����
	@RequestMapping(value="loadReserveList.do")
	public String selectReserveList(HashMap<String,Object> map) {
		//List<Object> mlist=mdao.selcetReserveMovieList();
		//model.addAttribute("user_info", dao.getUserInfo(id));
		System.out.println(mdao.selcetReserveMovieList());
		map.put("mlist",mdao.selcetReserveMovieList());
		return "view/jsp/Admin/myPage1";
	}
}
