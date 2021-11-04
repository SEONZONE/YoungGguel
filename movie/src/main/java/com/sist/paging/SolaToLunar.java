package com.sist.paging;

import java.util.ArrayList;

import javax.lang.model.element.Element;
import javax.lang.model.util.Elements;
import javax.swing.text.Document;

import org.jsoup.Jsoup;

public class SolaToLunar {


	// 월별 양력과 음력을 크롤링하고 양력, 음력 공휴일을 계산해서 리턴하는 메소드
		public static ArrayList<LunarDate> solarToLunar(int year, int month){
			ArrayList<LunarDate> lunarList=new ArrayList<>();  			// 1월 ~ 12월 양력과 대응되는 (음력)을 기억한다.
			ArrayList<LunarDate> list = new ArrayList<>();				// 인수로 넘겨받은 month의  양력에 대조되는 음력을 저장해 리턴할 객체
			String targerSite= "";
//			인수로 넘겨받은 year에 해당되는 1~12월 양력과 대응되는 음력을 크롤링해 얻어온다.
			for (int i = 1; i <= 1; i++) {
				targerSite = String.format("https://astro.kasi.re.kr/life/pageView/5?search_year=%04d&search_month=%02d", 
						year,i);
				try {
					Document doc = (Document) Jsoup.connect(targerSite).get();
//					Document 클래스 객체에 저장된 타겟 사이트의 정보 중에서 select() 메소드를 사용해 날짜(<tr>) 단위로 얻어온다.
					Elements tag = doc.select("tbody>tr");
					for (Element element : tag) {
						Elements ele = element.select("td");  	// <tag>에서 <td>만얻어온다.
//	    				get(0) : 양력 get(1) :음력 get(2): 경자년
						System.out.println("양력 : "+ele.get(0).text());
						System.out.println("음력 : "+ele.get(1).text());
						System.out.println("경자년 : "+ele.get(2).text());
						System.out.println("====================================================================");
						
						}
//						크롤링한 결과를 루나데이터 클래스 객체에 저장후 어레이 리스트에 저장.

				} catch (Exception e) {}
			}
			return null;
		}

	public static void main(String[] args) {
		solarToLunar(2021, 1);   		//2021년의 1월 음/양력을 얻어온다.
		}
	}
	[출처] 자바 - 크롤링(1)|작성자 장진호