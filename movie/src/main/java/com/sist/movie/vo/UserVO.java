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

   private String USERID;
   private String USERPW;
   private String USERNAME;
   private String USERGENDER;
   private int USERTEL;
   private String USERBIRTH;
   private String USEREMAIL;

}