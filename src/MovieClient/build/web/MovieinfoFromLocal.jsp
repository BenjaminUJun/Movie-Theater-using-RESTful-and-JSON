<%-- 
    Document   : MovieinfoFromLocal
    Created on : Aug 12, 2015, 1:20:10 PM
    Author     : Hugh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="servletslocal.DatainfoRetrive"%> 
<!DOCTYPE html>
<html>
<head>
<title>My Movie Theater | Local Movie</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<script src="FrontEnd/Standard/js/jquery.min.js"></script>
</head>
 <%
        String moviename = request.getParameter("moviename");
        moviename = moviename.toUpperCase();
        DatainfoRetrive restClient = new DatainfoRetrive(); 
        JSONObject movName = null;
   
        String movieName = null;
        String director = null;
        String stars = null;
        String producer = null;
        String writers = null;
        double rating = 0.0;
        int duration = 0;
 
        String rank = null;
        String movieGenre = null;
        String gamePictureURL = null;
         try{ 
              movName = JSONObject.fromObject(restClient.find_JSON(String.class,moviename));
          }catch (Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
            out.println("exception" + ex); 
          }
         if(movName == null)
         {
             response.sendRedirect("404.jsp");
             return;
         }
         else if(movName.getString("movieName").equalsIgnoreCase("No This Movie Information")){
                movieName = "No This Movie Information";
                director = "No This Movie Information";
                stars = "No This Movie Information";
                producer = "No This Movie Information";
                writers = "No This Movie Information";
                rating = 0.0;
                duration = 0;
                rank = "No This Movie Information";
                movieGenre = "No This Movie Information";
                gamePictureURL = "images/404.jpg"; 
         }
         else{
                movieName = movName.getString("movieName");
                director = movName.getString("director");
                stars = movName.getString("stars");
                producer = movName.getString("producer");
                writers = movName.getString("writers");
                rating = movName.getDouble("rating");
                duration = movName.getInt("duration");
                rank = movName.getString("rank");
                movieGenre = movName.getString("movieGenre");
                gamePictureURL = movName.getString("gamePictureURL");   
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
                   <ul class="breadcrumb breadcrumb__t"><a class="home" href="SearchLocalMovie.jsp">Local Search</a>  / Results</ul>
		   	 <div class="section grouppp">
				 <div class="cont1 span_2_of_t1">
				     <img src="<%=gamePictureURL%>" alt=""/> 
                                </div>
                                 <div class="cont1 span_2_of_t1">
                                     <header> 
                                     <h1 class="entry-title-font1"><%=movieName%></h1>
                                     </header>
                                    <div class="info">
                                        <p><a1>Director: </a1><a2> <%=director%></a2></p>   
                                           <p><a1>Stars: </a1><a2><%=stars%></a2></p>
                                           <p><a1>Producer: </a1><a2><%=producer%></a2></p>
                                           <p><a1>Writers:  </a1><a2><%=writers%></a2></p>
                                           <p><a1>Ratings:  </a1><a2><%=rating%> /10.0</a2></p>  
                                           <p><a1>Time:  </a1><a2><%=duration%> minutes</a2></p>
                                           <p><a1>Rank:  </a1><a2><%=rank%> level </a2></p>  
                                           <p><a1>Type:  </a1><a2><%=movieGenre%></a2></p>
                                    </div>
                                     
                                </div>
		      <div class="clear"></div>	
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
