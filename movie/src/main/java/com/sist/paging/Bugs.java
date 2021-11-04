package com.sist.paging;
import java.io.IOException;

import java.util.Iterator;

import org.jsoup.Jsoup;

import org.jsoup.nodes.Document;

import org.jsoup.nodes.Element;

import org.jsoup.select.Elements;

public class Bugs {

	​

public static void main(String[] args) {

​

    String url = "https://music.bugs.co.kr/chart";

    Document doc = null;

​

    try {

        doc = Jsoup.connect(url).get();

        Elements element = doc.select("table.byChart");

        Iterator<Element> title = element.select("p.title").iterator();

        Iterator<Element> artist = element.select("p.artist").iterator();

        Iterator<Element> rank = element.select("strong").iterator();

​

        while(rank.hasNext()) {

            System.out.println(rank.next().text() + "위 " + artist.next().text() + " - " + title.next().text());

        } 

        }catch(IOException e) {

            e.printStackTrace();

        }

    }

}
