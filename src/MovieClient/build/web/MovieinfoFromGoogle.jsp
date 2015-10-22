<%-- 
    Document   : MovieinfoFromGoogle
    Created on : Aug 11, 2015, 7:58:51 PM
    Author     : Hugh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="servlets.GoogleAPI.GoogleSearch"%> 
<%@page import="servlets.GoogleAPI.GoogleInfo"%> 
<!DOCTYPE html>
<html>
<head>
<title>My Movie Theater | Google Movie</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<script src="FrontEnd/Standard/js/jquery.min.js"></script>
</head>
<%
         String KeyWord = request.getParameter("keyword");  
         String getKeyWord = KeyWord.replace(" ", "+");
         GoogleInfo[] GoogleResults;
         try{
         GoogleResults = new GoogleSearch().search(getKeyWord);
         }catch(Exception ex){
             Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
             return;
         }
         int num = GoogleResults.length;
         if(num==0)
         {
             num++;
             GoogleInfo temporary = new  GoogleInfo("No Relavent Information","index.jsp","The KeyWord needs to be Correct!");
             GoogleResults = new  GoogleInfo[1];
             GoogleResults[0] = temporary;
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
	   </div>
   	   <div class="main">
   	     <div class="wrap">
   	       <div class="abstract">
                   <ul class="breadcrumb breadcrumb__t"><a class="home" href="SearchGoogleMovie.jsp">Google Search</a>  / Results</ul>
<%
         for(int i=0;i<num&&i<10;i++)
         {
             String title = GoogleResults[i].getTitle();
             String link = GoogleResults[i].getLink();
             String introinfo = GoogleResults[i].getSnippet();
%>                    

                                    <div class="post-excerpt body-font">
					<header>
						<h2 class="entry-title-font"><a href="<%=link%>"><%=title%></a></h2>
					</header>

					<div class="content-font">
						<p><%=introinfo%></p>
                                    </div>
					<footer>
						<p class="meta-info-font"><a href="<%=link%>"><%=link %></a></p>
					</footer>
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
</html>
