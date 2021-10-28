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
public class UserVO {

   private String USER_ID;
   private String USER_PW;
   private String USER_NAME;
   private String USER_GENDER;
   private int USER_TEL;
   private String USER_BIRTH;
   private String USER_EMAIL;

}