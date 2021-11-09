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
public class MovieVO {
   private int movieCd;
   private String movieNm;
   private String movieNmEn;
   private int showTm;
   private String openDt;
   private String endDt;
   private String contents;
   private String contents_s;
   private String prdtStatNm;
   private String nations;
   private String genre;
   private String directors;
   private String actors;
   private String watchGradeNm;
   private String companys;

}