package com.sist.movie.controller;

import java.io.FileOutputStream;
import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sist.movie.dao.AdminMovieDao;
import com.sist.movie.dao.MovieDao;
import com.sist.movie.vo.MovieVO;

@Controller
public class AdminMovieController {

	@Autowired
	private MovieDao dao;

	@Inject
	private AdminMovieDao Adao;
	// 유저 전체 리스트 가져오기
	// 전체 영화 조회

	@GetMapping(value = "SelectAllMovie.do")
	public String selectAllMovieAction(Model model) {
		model.addAttribute("AllMovieList", Adao.selectAllMovie());
		return "view/jsp/Admin/AdminMoviePage";
	}

	@PostMapping(value = "InsertMovie.do")
	public String insertMovie(@RequestParam HashMap<String, Object> map, @RequestParam(value = "poster", required = false) MultipartFile file) {
		System.out.println(map);
		Adao.insertMovie(map);
		
		String location = "C:\\Users\\sydxk\\YoungGgeul\\movie\\src\\main\\webapp\\view\\img\\";
		FileOutputStream fos = null;
		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		
		if (fileName.length() > 0) {
			try {
				fos = new FileOutputStream(location.concat(fileName));
				fos.write(file.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (fos != null)
						fos.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			System.out.println();
		}
		return "view/jsp/Admin/AdminMoviePage";
	}
	
	@PostMapping(value = "UpdateMovie.do")
	public void updateMovie(MovieVO vo) {
		System.out.println(vo);
		Adao.updateMovie(vo);
	}
	
	@RequestMapping(value = "DeleteMovie.do")
	public String deleteMovie(@RequestParam int movieCd) {
		Adao.deleteMovie(movieCd);
		return "redirect:SelectAllMovie.do"; 
	}
}
