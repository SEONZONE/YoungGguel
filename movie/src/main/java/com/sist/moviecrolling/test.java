package com.sist.moviecrolling;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.simple.*;
import org.json.simple.parser.*;

public class test {
	public static void main(String[] args) {
        test api = new test();
        api.requestAPI("20196270");  //�엫�쓽�쓽 �쁺�솕肄붾뱶(movieCd) �쟾�넚
    }

    public void requestAPI( String movieCd) {
    	String REQUEST_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json";
    	String AUTH_KEY = "581366190a6fcb8fa9a49aefcce52d69";

        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("key"     , AUTH_KEY);      // 諛쒓툒諛쏆� �씤利앺궎
        paramMap.put("movieCd" , movieCd);       // �쁺�솕肄붾뱶

        Map<String, Object> map = new HashMap();
        try {
            // �슂泥�(Request) - URL �뿰寃� 媛앹껜
            URL requestURL = new URL(REQUEST_URL+"?"+makeQueryString(paramMap));
            HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection();
 
            conn.setRequestMethod("GET"); // GET 諛⑹떇�쑝濡� �슂泥�
            conn.setDoInput(true);
 
            // �쓳�떟(Response) 援ъ“ ( Stream -> JSONObject )
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String readline = null;
            StringBuffer response = new StringBuffer();
            while ((readline = br.readLine()) != null) {
                response.append(readline);
                System.out.println("異쒕젰"+response.toString());
            }

          // JSON 媛앹껜濡� 蹂��솚臾멸뎄 異붽��삁�젙******************************************

            // JSON�쑝濡� �뙆�떛�븯湲�
        	JSONObject responseBody = new JSONObject(response.toString());
         
            // �뜲�씠�꽣 異붿텧
            JSONObject boxOfficee = responseBody.getJSONObject("movieInfoResult"); 
            JSONObject boxOfficeResult = boxOfficee.getJSONObject("movieInfo");          
          
            System.out.println("�쁺�솕紐� : "+boxOfficeResult.get("movieNm"));
            System.out.println("媛쒕큺�씪 : "+boxOfficeResult.get("openDt"));
            System.out.println("�긽�쁺�떆媛� : "+boxOfficeResult.get("showTm"));
            
            //諛곗뿴媛� 異쒕젰�븯湲�
            JSONArray dailyBoxOfficeList = boxOfficeResult.getJSONArray("actors");
            Iterator<Object> iter = dailyBoxOfficeList.iterator();
            
            System.out.println("諛곗슦�뱾 : ");
            while(iter.hasNext()) {
                JSONObject boxOffice = (JSONObject) iter.next();     
        		System.out.print(boxOffice.get("peopleNm")+"  "); 
            }

          // *********************************************************************
        } catch (IOException e) {
            e.printStackTrace();
        }

        
    }
    public String makeQueryString(Map<String, String> paramMap) {
        final StringBuilder sb = new StringBuilder();
 
        paramMap.entrySet().forEach(( entry )->{
            if( sb.length() > 0 ) {
                sb.append('&');
            }
            sb.append(entry.getKey()).append('=').append(entry.getValue());
        });
 
        return sb.toString();
    }


}