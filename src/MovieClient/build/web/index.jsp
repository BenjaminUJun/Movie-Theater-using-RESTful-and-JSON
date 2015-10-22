<%-- 
    Document   : index
    Created on : Aug 10, 2015, 11:23:26 PM
    Author     : Hugh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>My Movie Theater | Home Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <link rel="stylesheet" type="text/css" media="all" href="FrontEnd/index/css/metro.css" />
        <script type="text/javascript" src="FrontEnd/index/js/jquery.min.js"></script>
        <script type="text/javascript" src="FrontEnd/index/js/jquery.plugins.min.js"></script>
        <script type="text/javascript" src="FrontEnd/index/js/metro.js"></script>
    </head> 
    <body>
        <div class="metro-layout horizontal">
            <div class="header">
                <h1>My Movie Theater Homepage</h1>
                <div class="controls">
                    <span class="down" title="Scroll down"></span>
                    <span class="up" title="Scroll up"></span>
                    <span class="next" title="Scroll left"></span>
                    <span class="prev" title="Scroll right"></span>
                    <span class="toggle-view" title="Toggle layout"></span>
                </div>
            </div>
            <div class="content clearfix" align="center">
                <div class="items">
                    <a class="box" href="SearchSentiment.jsp" target="_blank"><span>Sentiment</span><img class="icon" src="FrontEnd/index/images/mail.png" alt="" /></a>
                    <a class="box" href="MovieIndexInsert.jsp" style="background: #6b6b6b;" target="_blank"><span>Add Movie</span><img class="icon" src="FrontEnd/index/images/settings.png" alt="" /></a>
                    <a class="box width2 height2" href="SearchFlickr.jsp" target="_blank"><span>Photos</span><img class="cover" src="FrontEnd/index/images/gallery.jpg" alt="" /></a>
                    <a class="box" href="SearchLocalMovie.jsp" style="background: #ffc808;" target="_blank"><span>Local Movie</span><img class="icon" src="FrontEnd/index/images/winamp.png" alt="" /></a>
                    <a class="box" href="SearchYoutubeVideo.jsp" style="background: #00a9ec;" target="_blank"><span>Video</span><img class="icon" src="FrontEnd/index/images/tasks.png" alt="" /></a>
                    <a class="box" href="SearchGoogleMovie.jsp" style="background: #f874a4;" target="_blank"><span>Google Movie</span><img class="icon" src="FrontEnd/index/images/dribbble.png" alt="" /></a>
                </div>
            </div>
        </div>
        <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
            <p>Recommended Browser：IE8、360、FireFox、Chrome、Safari、Opera <br/>Copyright &copy; 2015.Made by Hugh All rights reserved.</p>
        </div>
    </body>
</html>


