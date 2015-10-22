<%-- 
    Document   : MovieIndexInsert
    Created on : Aug 10, 2015, 13:34:17 PM
    Author     : Hugh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- Reset Stylesheet -->
<!link rel="stylesheet" href="FrontEnd/SearchMovie/css/reset.css" type="text/css" media="screen" /-->
<!-- Main Stylesheet -->
<!link rel="stylesheet" href="FrontEnd/SearchMovie/css/style.css" type="text/css" media="screen" /-->
<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
<!link rel="stylesheet" href="FrontEnd/SearchMovie/css/invalid.css" type="text/css" media="screen" /-->

<title>My Movie Theater | Add Movie</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<script src="FrontEnd/Standard/js/jquery.min.js"></script>
</head>
    
<body id="login">
 <div class="index-banner">
  <div class="header-top">	
	<div class="wrap">
   		<div class="logo">
			<a href="index.jsp"><img src="FrontEnd/Standard/images/logo.png" alt=""/></a>
		</div>	
		<div class="menu">																
			<a href="#" class="right_bt" id="activator"><img src="FrontEnd/Standard/images/nav_icon.png" alt=""></a>
				<div class="box" id="box">
				   <div class="box_content_center">
					   <div class="menu_box_list">
						   <ul>
							   <li><a href="index.jsp">Home</a></li>
							   <li class="active"><a href="SearchLocalMovie.jsp">Local Movie</a></li>
                                                           <li><a href="SearchGoogleMovie.jsp">Google Movie</a></li> 
							   <li><a href="SearchYoutubeVideo.jsp">Video</a></li> 
							   <li><a href="SearchFlickr.jsp">Picture</a></li>
							   <li><a href="SearchSentiment.jsp">Sentiment</a></li>
						   </ul>
						</div>
						<a class="boxclose" id="boxclose"><img src="FrontEnd/Standard/images/close.png" alt=""></a>
					  </div>                
					</div>
			                 <script type="text/javascript">
								var $ = jQuery.noConflict();
									$(function() {
										$('#activator').click(function(){
												$('#box').animate({'top':'0px'},500);
										});
										$('#boxclose').click(function(){
												$('#box').animate({'top':'-700px'},500);
										});
									});
									$(document).ready(function(){
									
									//Hide (Collapse) the toggle containers on load
									$(".toggle_container").hide(); 
									
									//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
									$(".trigger").click(function(){
										$(this).toggleClass("active").next().slideToggle("slow");
										return false; //Prevent the browser jump to the link anchor
									});
									
									});
								</script>
			         </div> 	
			         <div class="clear"></div>		
		  </div>	
		</div>	
	    <div class="wmuSlider example1">
			   <article style="position: absolute; width: 100%; opacity: 0;"> 
				   	<div class="banner-wrap">
						<div class="cont span_2_of_3">
						    <h1>Input movie name into local Website.</h1>
						     <div class="search_box">
								<form name="Search Movie" method="post" action="MovieIndexQueryServlet">
								   <input name="param1" type="text" value="Movie Name..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Movie Name...';}"><input type="submit" value="">
                                                                </form>
			 				</div>
						</div>
					</div>
				 </article>
				 <article style="position: absolute; width: 100%; opacity: 0;"> 
				   	<div class="banner-wrap">
						<div class="cont span_2_of_3">
						   <h1>Input movie name into local Website.</h1>
						</div>
					</div>
				 </article>
		  </div>
                  <script src="FrontEnd/Standard/js/jquery.wmuSlider.js"></script> 
					<script>
       				     $('.example1').wmuSlider();         
   					</script> 	           	      
   	   </div>
   	   <div class="main">
   	     <div class="content-top">
                  <div class="section1">
				<div class="cont1 span_2_of_about">
					<h3 class="m_1" align="center"><a size="12px">Note: If this movie is duplicate, you will return to the home page.</a></h3>
		    </div>
   	   	 </div>
   	   	 <div class="content-bottom">
   	   	    <h2 class="m_2"></h2>
   	   	 	  <div class="wrap">
   	   	 	  	<div class="section group">
				<div class="clear"></div>
			</div>
   	   	   </div>
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
</html>
