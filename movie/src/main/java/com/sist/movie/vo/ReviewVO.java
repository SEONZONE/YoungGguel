package com.sist.movie.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private int reviewNo;
	private int movieCd;
	private String userId;
	private String comments;
	private String registerDate;
	private String updateDate;
	
}
