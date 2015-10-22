/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.GoogleAPI;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author Hugh
 */
public class GoogleSearch {

    private static String KEY;
    private static String CX;
    private static final String PROP_FILE = GoogleSearch.class.getSimpleName().toLowerCase() + ".properties";
       
    static {
        try {
            Properties props = new Properties();
            props.load(GoogleSearch.class.getResourceAsStream(PROP_FILE));
            KEY = props.getProperty("api_key");
            CX=props.getProperty("api_cx");
        } catch (IOException ex) {
            Logger.getLogger(GoogleSearch.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // Define Google search API
    
    public static GoogleInfo[] search(String keyword) throws Exception {

            GoogleInfo[] GoogleResult = new GoogleInfo[0]; 
        try{
            String newKeyword = new String(keyword.getBytes("ISO-8859-1"),"UTF-8");
            //To solve the problem that when you enter the Chinese characters, the characters will be parsed into messy codes.  
            System.out.println("the searched keyword is: " + newKeyword);
            URL url = new URL(
                    "https://www.googleapis.com/customsearch/v1?key=" + KEY + "&cx=" + CX + "&q=" + newKeyword + "&alt=json");

            HttpURLConnection connToGoogle = (HttpURLConnection) url.openConnection();
            connToGoogle.setRequestMethod("GET");
            connToGoogle.setRequestProperty("Accept", "application/json");
            if(connToGoogle.getResponseCode()==200)
            {
                InputStream in = connToGoogle.getInputStream();
                InputStreamReader inReader = new InputStreamReader(in, "utf-8");
                BufferedReader readerFromGoogle = new BufferedReader(inReader);
                StringBuffer stringBufferFromGoogle = new  StringBuffer();
                String lineFromGoogle = "";
                while ((lineFromGoogle = readerFromGoogle.readLine()) != null) {
                    stringBufferFromGoogle.append(lineFromGoogle);
                }
                String jsonStringFromGoogle = null;
                jsonStringFromGoogle = stringBufferFromGoogle.toString();
                System.out.println(jsonStringFromGoogle);
                if(jsonStringFromGoogle!=null)
                {
                JSONObject jo = JSONObject.fromObject(jsonStringFromGoogle);

              try{  JSONArray GoogleJSONArray = jo.getJSONArray("items");
                    ArrayList<GoogleInfo> templist = new ArrayList<GoogleInfo>();
                    for (int i = 0; i < GoogleJSONArray.size(); i++) {
                        GoogleJSONArray.getJSONObject(i);
                        String title = GoogleJSONArray.getJSONObject(i).getString("title");
                        String link = GoogleJSONArray.getJSONObject(i).getString("link");
                        //Snippet: Introduction or extration of the searched object.
                        String snippet = GoogleJSONArray.getJSONObject(i).getString("snippet");
                        GoogleInfo googleinfo = new GoogleInfo(title,link,snippet);
                        templist.add(googleinfo);
                    }
                    GoogleResult = new GoogleInfo[templist.size()];
                    templist.toArray(GoogleResult);
              }catch (net.sf.json.JSONException ex){
                   Logger.getLogger(GoogleInfo.class.getName()).log(Level.SEVERE, null, ex);
                   System.out.println("error happened!");
              }
            connToGoogle.disconnect();
        }
        }
            else
            {
                InputStream in = connToGoogle.getErrorStream();
                throw new RuntimeException("The conncetion to Google server is falied.\n"
                        + "The HTTP error code is: " + connToGoogle.getResponseCode());
            }
            
    }catch (IOException ex){
            Logger.getLogger(GoogleInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return GoogleResult;
    }  
}
