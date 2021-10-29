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
public class TheaterVO {

	int theaterNo;
	private String theaterCity;
	private String theaterTown;
	private String theaterGwan;
	private String theaterRoomSeat;
}
