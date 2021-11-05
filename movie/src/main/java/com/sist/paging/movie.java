package com.sist.paging;

import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class movie {
	public static void main(String[] args) {
		


	    String url="https://movie.naver.com/movie/sdb/rank/rmovie.naver?sel=cnt&date=20211103";

	    Document doc = null;


	   try {
		doc=Jsoup.connect(url).get(); 	
		Elements element=doc.select("table.list_ranking");
		Iterator<Element> movietitle=element.select("div.tit3").iterator();
//		Iterator<Element> reserverate=element.select("strong.percent").iterator();
//		Iterator<Element> opendate =element.select("strong").iterator();
		
		int rank=0;
		
		while(rank<50) {
			System.out.println(rank+"�쐞 "+movietitle.next().text());
			rank++;
	} 
	   }	catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}

	    

	}
}