<%-- 
    Document   : VideosFromYoutube
    Created on : Aug 12, 2015, 8:57:54 PM
    Author     : Hugh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="servlets.Youtube.YoutubeSearch"%> 
<%@page import="servlets.Youtube.YoutubeInfo"%> 
<%@page import="com.google.gdata.client.youtube.YouTubeService"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My Movie Theater | Video</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <script src="FrontEnd/Standard/js/jquery.min.js"></script>
    </head>
    <%
        String movieName = request.getParameter("keyword");
        YoutubeInfo[] videoinfo;
        try{
        videoinfo = YoutubeSearch.searchfeed(movieName);
        }catch(Exception ex){
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
            return;
        }
        
        if(movieName==null){
                movieName = "movie";
        }
        int num = videoinfo.length;
        if (num <= 0) {
            response.sendRedirect("404.jsp");
            return;
        }
    %>
    <body>
        <div class="index-banner1">
            <div class="header-top">	
                <div class="wrap">
                    <div class="logo">
                        <a href="index.jsp"><img src="images/logo.png" alt=""/></a>
                    </div>	
                    <div class="menu">																
                        <a href="#" class="right_bt" id="activator"><img src="images/nav_icon.png" alt=""></a>
                        <div class="box" id="box">
                            <div class="box_content_center1">
                                <div class="menu_box_list1">
                                    <ul>
                                        <li><a href="index.jsp">Home</a></li>
                                        <li class="active"><a href="SearchLocalMovie.jsp">Local Movie</a></li> 
                                        <li><a href="SearchGoogleMovie.jsp">Google Movie</a></li> 
                                        <li><a href="SearchYoutubeVideo.jsp">Video</a></li>
                                        <li><a href="MovieIndexInsert.jsp">Add Movie</a></li>
                                        <li><a href="SearchSentiment.jsp">Sentiment</a></li>
                                    </ul>
                                </div>
                                <a class="boxclose" id="boxclose"><img src="images/close.png" alt=""></a>
                            </div>                
                        </div>
                        <script type="text/javascript">
                            var $ = jQuery.noConflict();
                            $(function () {
                                $('#activator').click(function () {
                                    $('#box').animate({'top': '0px'}, 500);
                                });
                                $('#boxclose').click(function () {
                                    $('#box').animate({'top': '-700px'}, 500);
                                });
                            });
                            $(document).ready(function () {

                                //Hide (Collapse) the toggle containers on load
                                $(".toggle_container").hide();

                                //Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
                                $(".trigger").click(function () {
                                    $(this).toggleClass("active").next().slideToggle("slow");
                                    return false; //Prevent the browser jump to the link anchor
                                });

                            });
                        </script>
                    </div> 	
                    <div class="clear"></div>		
                </div>	
            </div>	
        </div>
        <div class="main">
            <div class="wrap">
                <div class="abstract">
                    <ul class="breadcrumb breadcrumb__t"><a class="home" href="SearchYoutubeVideo.jsp">Video Search</a>  / Results</ul>                
                    <%
                        for (int i = 0; i < num && i < 4; i++) {
                                String videoTitle1, videoTitle2;
                            if(videoinfo[2*i+1].getVideoTitle()==null){
                                videoTitle1 = "No Title.";
                            }
                            else {
                                videoTitle1 = videoinfo[2*i+1].getVideoTitle().replace("NULL", movieName);
                            }
                            String videoURL1 = videoinfo[2*i+1].getTrueVideoURL();
                            if(videoinfo[2*i+2].getVideoTitle()==null){
                                videoTitle2 = "No Title.";
                            }else {
                                videoTitle2 = videoinfo[2*i+2].getVideoTitle().replace("NULL", movieName);
                            }
                            String videoURL2 = videoinfo[2*i+2].getTrueVideoURL();
                    %>                                   
                    <div class="blog-top2">
                    <div class="col_1_of_b span_1_of_b2">
                        <h3><a>No.<%= 2*i + 1%>.Title: <%= videoTitle1%></a></h3>
                        <p name="Video" value="<%= videoURL1%>"></p>
                        <embed src="<%=videoURL1%>" autostart="false" loop="false" wmode="transparent" width="580" height="420" ></embed>
                    </div>
                    <div class="col_1_of_b span_1_of_b2">
                         <h3><a>No.<%= 2*i + 2%>.Title: <%= videoTitle2%></a></h3>
                         <p name="Video" value="<%= videoURL2%>"></p>
                         <embed src="<%=videoURL2%>" autostart="false" loop="false" wmode="transparent" width="580" height="420" ></embed>
                    </div>
                    <div class="clear"></div>
                    </div>
                    <%
                        }
                    %>                     
                    
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="wrap">
                <div class="copy">
                    <p>Copyright &copy; 2015.Made by Hugh All rights reserved.</p>
                </div>
            </div>
        </div>
        <div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
    </body>
</html>>
