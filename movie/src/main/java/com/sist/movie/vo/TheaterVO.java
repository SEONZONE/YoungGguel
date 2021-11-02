package com.sist.movie.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TheaterVO{
	
	int theaterNo;
	private String theaterCity;
	private String theaterTown;
	private String theaterGwan;
	private String theaterRoomSeat;

}

