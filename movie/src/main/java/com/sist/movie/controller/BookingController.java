package com.sist.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.movie.dao.BookDao;
import com.sist.movie.dao.MovieDao;
import com.sist.movie.dao.TheaterDao;
import com.sist.movie.vo.BookVO;
import com.sist.movie.vo.MovieVO;

@Controller
public class BookingController {

	@Autowired
	private MovieDao mdao;

	@Autowired
	private TheaterDao tdao;

	@Autowired
	private BookDao bdao;

	@ResponseBody
	@RequestMapping(value = "nameList.do")
	public List<?> movieListAction(String select, String city) {

		if (select.equals("movieList")) {
			return mdao.movieList();
		}

		else if (select.equals("cityList")) {
			System.out.println(tdao.theaterCity());
			return tdao.theaterCity();

		} else if (select.equals("townList")) {
			System.out.println(tdao.theaterTown());
			return tdao.theaterTown();

		}
		return mdao.movieList();

	}

	@ResponseBody
	@RequestMapping(value = "selectBookList.do")
	public List<BookVO> movieSelectAction(String town, String day, String movie, String page) {
		String temp = "";
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (movie != null) {
			map.put("movie", movie);
			if (town != null) {
				map.put("town", town);
				if (day != null) {
					map.put("day", day);
				}
			}
		}
		return bdao.movieSelectAction(map);

	}

	@ResponseBody
	@RequestMapping(value = "selectSeatList.do")
	public List<BookVO> seatSelectAction(String town, String day, String movie, String time) {
		System.out.println(town + " " + day + "  " + movie + " " + time);
		HashMap<String, Object> mapSeat = new HashMap<String, Object>();
		mapSeat.put("town", town);
		mapSeat.put("day", day);
		mapSeat.put("movie", movie);
		mapSeat.put("time", time);
		System.out.println(" ======== BOOKVO 리스트 ======== ");
		bdao.seatSelectAction(mapSeat);

		System.out.println(bdao.seatSelectAction(mapSeat));
		return bdao.seatSelectAction(mapSeat);
	}

	@ResponseBody
	@PostMapping(value = "insertBooking.do")
	public String insertBooking(String time, String seat1, String seat2, String userId, String seatNo) {
		System.out.println(time + " " + seat1 + " " + seat2 + " " + userId + " " + seatNo);
		HashMap<String, Object> changeSeat = new HashMap<String, Object>();
		BookVO vo = new BookVO();
		int numberTime = Integer.parseInt(time);
		int seatNo1 = Integer.parseInt(seatNo);
		vo.setBookingTimeNo(numberTime);
		vo.setBookingUserId(userId);
		changeSeat.put("seatNo", seatNo1);
		if (seat2 != null) {

			changeSeat.put("seat1", seat1);
			changeSeat.put("seat2", seat2);

		} else
			changeSeat.put("seat1", seat1);

		System.out.println(" ======== Map 리스트 ======== ");
		System.out.println("Map리스트: " + changeSeat);

		System.out.println("시간표 넘버:" + vo.getBookingTimeNo());
		System.out.println("유저이름:" + vo.getBookingUserId());

		bdao.updateSeat(changeSeat);
		bdao.insertBooking(vo);

		return "success!";

	}

	// 위치 위도, 경도 불러오기 
	@ResponseBody
	@RequestMapping(value = "selectLocation.do")
	public List<BookVO> selectLocation(String location) {
		System.out.println(" 타운이름 : "+location);
		System.out.println(bdao.selectLocation(location));
		return bdao.selectLocation(location);
	}

}
