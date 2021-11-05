package com.sist.paging;

import java.io.FileOutputStream;
import java.io.OutputStream;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class OutputMain {
	public static void main(String[] args) {
		Article article=new Article(1,"2020-12-12/12:12:12","제목","내용");
		
		String articleJson=article.toJson();
		String fileName=article.getId()+".txt";
		
		try {
			OutputStream output =new FileOutputStream("1.txt");
			output.write(articleJson.getBytes());
			//String srt="오늘은 날씨가 좋네여";
			
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
	
	}
	
	

}


class Article{
	
	private int id;
	private String regDate;
	private String body;
	private String title;
	public String toJson() {
		// TODO Auto-generated method stub
		String rs=String.format("{\"id\":%d,\"regDate\":%s,\"title\":%s,\"body\":%s}",id,regDate,title,body);
		return rs;
	}
	
	
public Article(int id, String regDate, String body, String title) {
		super();
		this.id = id;
		this.regDate = regDate; 
		this.body = body;
		this.title = title;
	}
public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
