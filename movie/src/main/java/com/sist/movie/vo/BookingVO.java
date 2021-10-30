package com.sist.movie.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BookingVO {
	private int booking_no; //50001부터
	private int payment_no; //P1 P2 P3
	private int movie_no; 	//10001부터
	private int theater_no; //30001부터
	private String user_id;
	private int bk_usecoupon;  //1이면 트루 0이면 미사용으로 하자
	private int bk_adult;
	private int bk_child;
	private int bk_senior;
	private String bk_date;
}
