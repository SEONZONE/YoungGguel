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
public class AskVO {


	private int ask_no;
	private String ask_title;
	private String ask_contents;
	private String ask_fileName;
	private String ask_regdate;
	private int pnum;
	private int ref;
	private String user_id;
	private String answer_ck;
	private String job;
	
}
