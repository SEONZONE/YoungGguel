package com.sist.movie.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class BookVO {

	   private int bookingNo;
	   private String bookingMovieName;
	   private String bookingDate;
	   private String bookingTown;
	   private int bookingPayNo;
	   private String bookingSeat1;
	   private String bookingSeat2;
	   
	}