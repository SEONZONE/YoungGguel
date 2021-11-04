package com.sist.paging;

import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class movie {
	public static void main(String[] args) {
		


	    String url="http://www.cgv.co.kr/movies/";

	    Document doc = null;


	   try {
		doc=Jsoup.connect(url).get();
		Elements element=doc.select("table.list-wrap");
		Iterator<Element> movietitle=element.select("strong.title").iterator();
		Iterator<Element> reserverate=element.select("strong.percent").iterator();
//		Iterator<Element> opendate =element.select("strong").iterator();
		
		int rank=0;
		
		while(rank<50) {
			System.out.println(rank+"위"+movietitle.next().text()+" -예매율: "+reserverate.next().text());
			rank++;
	} 
	   }	catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}

	    

	}
}