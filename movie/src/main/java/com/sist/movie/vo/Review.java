package com.sist.movie.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Review {

	private Long reviewNo;
	private String userId;
	private String comments;
	private Date registerDate;
	private String moviecd;
	private Date updateDate;
	
}
