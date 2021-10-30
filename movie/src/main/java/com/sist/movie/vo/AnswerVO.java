package com.sist.movie.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class AnswerVO {
	private int answer_no;
	private String answer_title;
	private String answer_contents;
	private int answer_pnum;
	private String answer_file;
	private String job;
	
}
