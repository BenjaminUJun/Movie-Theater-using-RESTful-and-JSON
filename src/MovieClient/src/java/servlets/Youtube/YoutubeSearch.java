package servlets.Youtube;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author CMR
 */
/*
 * Copyright (c) 2012 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */

import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.services.youtube.YouTube;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.google.api.services.youtube.model.SearchListResponse;
import com.google.api.services.youtube.model.SearchResult;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;



public class YoutubeSearch {

    private static String apiKey;
    private static final String PROP_FILE = YoutubeSearch.class.getSimpleName().toLowerCase() + ".properties";
    private static final long NUMBER_OF_VIDEOS_RETURNED = 10;
    
        static {
        try {
            Properties props = new Properties();
            props.load(YoutubeSearch.class.getResourceAsStream(PROP_FILE));
            apiKey = props.getProperty("api_key");
        } catch (IOException ex) {
            Logger.getLogger(YoutubeSearch.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static YouTube youtube;


    public static YoutubeInfo[] searchfeed(String moviename){
        YoutubeInfo[] videoList  = new YoutubeInfo[0];
        ArrayList<YoutubeInfo> templist = new ArrayList<YoutubeInfo>();
        try {
            youtube = new YouTube.Builder(Auth.HTTP_TRANSPORT, Auth.JSON_FACTORY, new HttpRequestInitializer() {
                @Override
                public void initialize(HttpRequest request) throws IOException {
                }
            }).setApplicationName("youtubeWeb").build();
            String queryTerm = moviename+" official trailer";    
            YouTube.Search.List search = youtube.search().list("id,snippet");
            search.setKey(apiKey);
            search.setQ(queryTerm);
            search.setType("vedio");
            search.setFields("items(id/kind,id/videoId,snippet/title,snippet/thumbnails/default/url)");
            search.setMaxResults(NUMBER_OF_VIDEOS_RETURNED);
            SearchListResponse searchResponse = null;
         try{
             searchResponse = search.execute();
         }catch(IOException e)
         {
             Logger.getLogger(YoutubeSearch.class.getName()).log(Level.SEVERE, null, e);
             searchResponse = null;
         }
         if(searchResponse != null)
         {
             List<SearchResult> searchResultList = searchResponse.getItems();       
            if (searchResultList != null) {
                for(SearchResult tempVideoResult :searchResultList){
                    YoutubeInfo temp = new YoutubeInfo();
                    String videoTitle= tempVideoResult.getSnippet().getTitle();
                    temp.setVideoTitle(videoTitle);
                    String videoThumbnail = tempVideoResult.getSnippet().getThumbnails().getDefault().getUrl();
                    temp.setThumbnailURL(videoThumbnail);
                    String videoID = tempVideoResult.getId().getVideoId(); 
                    temp.setVideoID(videoID);
                    templist.add(temp);            
                }
            }
            videoList  = new YoutubeInfo[templist.size()];
            templist.toArray(videoList);         
         }  
        } catch (GoogleJsonResponseException e) {
            Logger.getLogger(YoutubeSearch.class.getName()).log(Level.SEVERE, null, e);
        } catch (IOException e) {
            Logger.getLogger(YoutubeSearch.class.getName()).log(Level.SEVERE, null, e);
        }
        return videoList;
        } 
    }
