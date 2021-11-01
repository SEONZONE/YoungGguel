package com.sist.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.sist.movie.dao.StoreDao;
import com.sist.movie.vo.ProductVO;


@Controller
@RequestMapping(value="/store")
public class storeController {
	
	@Autowired
	private StoreDao dao;
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET) // URL�� �������� ���Ͻ�Ű��
	public ModelAndView store(ModelAndView model, HttpServletRequest request, HttpServletResponse response) {
		model.setViewName("/view/jsp/store");
		return model;
	}
	
	/* ����� ���� ī�װ��� ������������  */
	@RequestMapping(value="/main.do", method=RequestMethod.POST)
	@ResponseBody
	public List<ProductVO> selectProductList(String Kategorie) {
		System.out.println(Kategorie);
		if(Kategorie.equals("ticket")){
			return dao.selectTicketProductList();
		}
		if(Kategorie.equals("goods")){
			return dao.selectGoodsProductList();
		}
		if(Kategorie.equals("hot")){
			return dao.selectProductList();
		}
		return dao.selectProductList();
	}
	
	/* ����� ������ ������ ���� */
	@RequestMapping(value="/store-detail.do")
	public String selectProductDetail(int no, Model model){
		model.addAttribute("detail", dao.selectProductDetail(no));
		return "view/jsp/store-detail";
	}
	
	@RequestMapping(value="/buy.do")
	public ModelAndView productbuy(int pno,int price,int count,int totalprice,ModelAndView model) {
		System.out.println(pno+"�� ����"+price+"��"+count+"��"+totalprice+"�� �Դϴ�");
		model.setViewName("/view/jsp/store");
		return model;
	}
}
