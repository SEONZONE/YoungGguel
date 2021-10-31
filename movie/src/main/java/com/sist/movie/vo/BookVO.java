package com.sist.movie.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BookVO {

	   private int bookingNo;
	   private String bookingMovieName;
	   private String bookingDate;
	   private String bookingTown;
	   private int bookingPayNo;
	   private String bookingSeat1;
	   private String bookingSeat2;
	 
	   
		/* 성종추가버전 */
	   private String bookingTheaterroomseat;
	   private String bookingGwan;
	   private String bookingSeat;
	   private String bookingTimeStart;
	   private String bookingTimeEnd;
	   private String bookingTheaterNo;
	   private String bookingMovieNo;
	   private String bookingTimeNo;
	   private String bookingSeatNo3;
	   private String bookingSeatNo1;
	   private String bookingSeatNo2;
	   private String bookingSeatNo4;
	  
	   
	}