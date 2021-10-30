package com.sist.movie.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MovieDemoVO {
	private String reserve_date;
	private int reserve_no;
	private String movie_title;
	private String reserve_info;
	private int pay_total;
	private String pay_date;
}
