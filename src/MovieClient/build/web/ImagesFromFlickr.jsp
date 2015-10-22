<%-- 
    Document   : ImagesFromFlickr
    Created on : Aug 11, 2015, 6:51:00 PM
    Author     : Hugh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="servletslocal.Flickr"%>
<!DOCTYPE html>
<html>
<head>
<title>My Movie Theater|Image</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<script src="FrontEnd/Standard/js/jquery.min.js"></script>
<script src="FrontEnd/Standard/js/jquery.magnific-popup.js" type="text/javascript"></script>
		<link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
		<script>
			$(document).ready(function() {
				$('.popup-with-zoom-anim').magnificPopup({
					type: 'inline',
					fixedContentPos: false,
					fixedBgPos: true,
					overflowY: 'auto',
					closeBtnInside: true,
					preloader: false,
					midClick: true,
					removalDelay: 300,
					mainClass: 'my-mfp-zoom-in'
			});
		});
		</script>
</head>
     <%
         String movieName = request.getParameter("moviename");
         String[] imgsURLs = new String[12];
         String errors = "images/404.jpg";
         try{
                Flickr flickr = Flickr.getInstance();
                if (flickr == null)
                { //Exception handle.
                    for(int i = 0;i<12;i++)
                    {
                        imgsURLs[i] = errors; 
                    }
                }else{
                    URL[] picURLs =  flickr.search(movieName);
                int URLnumber = picURLs.length;
                if(URLnumber<12&&URLnumber>0)
                {
                    for(int i = URLnumber-1;i<12;i++)
                    {
                        imgsURLs[i] = errors; 
                    }
                }
                else if(URLnumber==12)
                {
                    for(int i=0;i<12;i++)
                    {
                       imgsURLs[i] = picURLs[i].toString();
                    }
                }
                else
                {
                    for(int i = 0;i<12;i++)
                    {
                        imgsURLs[i] = errors; 
                    }
                }                             
               }
            }catch (Exception ex) { 
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
            out.println("exception:" + ex);
        }      
  %>
<body>
<div class="index-banner1">
  <div class="header-top">	
	<div class="wrap">
   		<div class="logo">
			<a href="index.jsp"><img src="FrontEnd/Standard/images/logo.png" alt=""/></a>
		</div>	
		<div class="menu">																
			<a href="#" class="right_bt" id="activator"><img src="FrontEnd/Standard/images/nav_icon.png" alt=""></a>
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
						 <a class="boxclose" id="boxclose"><img src="FrontEnd/Standard/images/close.png" alt=""></a>
					 </div>                
			      </div>
			                 <script type="text/javascript">
								var $ = jQuery.noConflict();
									$(function() {
                                                                            
                                                                                $(".pictre img").addClass("carousel-inner img-responsive img-rounded");
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
		   	 <ul class="breadcrumb breadcrumb__t"><a class="home" href="SearchFlickr.jsp">Image Search</a>  / Flickr</ul>
			  <div class="section group">
				 <div class="cont1 span_2_of_g1">
				      <div class="section group">
						<div class="col_1_of_about-box span_1_of_about-box">
						 <a class="popup-with-zoom-anim" href="#small-dialog"><img src="<%=imgsURLs[0]%>" width=400 height=300 title="continue" alt=""/></a>
		                     <div id="small-dialog" class="mfp-hide">
							   <div class="pop_up">
							   	  <img class="pictre" src="<%=imgsURLs[0]%>" alt=""/>
							   	  <div class="mfp-title"><%=movieName%></div>
								</div>
							 </div>
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">1st</a></h4>
			                   	<p class="g_2"><a href="#"><%=movieName%></a></p>
			                   </div>
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						    <a class="popup-with-zoom-anim" href="#small-dialog1"><img src="<%=imgsURLs[1]%>" width=400 height=300 title="continue" alt=""/></a>
                                                    <div id="small-dialog1" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="<%=imgsURLs[1]%>" alt=""/>
							   	  <div class="mfp-title"><%=movieName%></div>
								</div>
							 </div>
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">2nd</a></h4>
			                   	<p class="g_2"><a href="#"><%=movieName%></a></p>
			                   </div>
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog2"><img src="<%=imgsURLs[2]%>" width=400 height=300 title="continue" alt=""/></a>
		                     <div id="small-dialog2" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="<%=imgsURLs[2]%>" alt=""/>
							   	  <div class="mfp-title"><%=movieName%></div>
								</div>
							 </div> 
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">3rd</a></h4>
			                   	<p class="g_2"><a href="#"><%=movieName%></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
				        <div class="clear"></div> 
					</div>
					<div class="section group">
						<div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog4"><img src="<%=imgsURLs[3]%>" width=400 height=300 title="continue" alt=""/></a>
		                     <div id="small-dialog4" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="<%=imgsURLs[3]%>" alt=""/>
							   	  <div class="mfp-title"><%=movieName%></div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">4th</a></h4>
			                   	<p class="g_2"><a href="#"><%=movieName%></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						    <a class="popup-with-zoom-anim" href="#small-dialog5"><img src="<%=imgsURLs[4]%>" width=400 height=300 title="continue" alt=""/></a>
		                     <div id="small-dialog5" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="<%=imgsURLs[4]%>" alt=""/>
							   	  <div class="mfp-title"><%=movieName%></div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">5th</a></h4>
			                   	<p class="g_2"><a href="#"><%=movieName%></a></p>
			                   </div>
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog6"><img src="<%=imgsURLs[5]%>" width=400 height=300 title="continue" alt=""/></a>
		                     <div id="small-dialog6" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="<%=imgsURLs[5]%>" alt=""/>
							   	  <div class="mfp-title"><%=movieName%></div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">6th</a></h4>
			                   	<p class="g_2"><a href="#"><%=movieName%></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
				        <div class="clear"></div> 
					</div>
					<div class="section group">
						<div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog7"><img src="<%=imgsURLs[6]%>" width=400 height=300 title="continue" alt=""/></a>
		                     <div id="small-dialog7" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="<%=imgsURLs[6]%>" alt=""/>
							   	  <div class="mfp-title"><%=movieName%></div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">7th</a></h4>
			                   	<p class="g_2"><a href="#"><%=movieName%></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog8"><img src="<%=imgsURLs[7]%>" width=400 height=300 title="continue" alt=""/></a>
		                     <div id="small-dialog8" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="<%=imgsURLs[7]%>" alt=""/>
							   	  <div class="mfp-title"><%=movieName%></div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">8th</a></h4>
			                   	<p class="g_2"><a href="#"><%=movieName%></a></p>
			                   </div>
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog9"><img src="<%=imgsURLs[8]%>" width=400 height=300 title="continue" alt=""/></a>
		                     <div id="small-dialog9" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="<%=imgsURLs[8]%>" alt=""/>
							   	  <div class="mfp-title"><%=movieName%></div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">9th</a></h4>
			                   	<p class="g_2"><a href="#"><%=movieName%></a></p>
			                   </div>
			                   <div class="clear"></div>
			               </div>		
					     </div>
				        <div class="clear"></div> 
					</div>
					<div class="section group">
						<div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog10"><img src="<%=imgsURLs[9]%>" width=400 height=300 title="continue" alt=""/></a>
		                     <div id="small-dialog10" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="<%=imgsURLs[9]%>" alt=""/>
							   	  <div class="mfp-title"><%=movieName%></div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">10th</a></h4>
			                   	<p class="g_2"><a href="#"><%=movieName%></a></p>
			                   </div>
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						    <a class="popup-with-zoom-anim" href="#small-dialog11"><img src="<%=imgsURLs[10]%>" width=400 height=300 title="continue" alt=""/></a>
		                     <div id="small-dialog11" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="<%=imgsURLs[10]%>" alt=""/>
							   	  <div class="mfp-title"><%=movieName%></div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">11th</a></h4>
			                   	<p class="g_2"><a href="#"><%=movieName%></a></p>
			                   </div>
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div class="col_1_of_about-box span_1_of_about-box">
						   <a class="popup-with-zoom-anim" href="#small-dialog12"><img src="<%=imgsURLs[11]%>" width=400 height=300 title="continue" alt=""/></a>
		                     <div id="small-dialog12" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="<%=imgsURLs[11]%>" alt=""/>
							   	  <div class="mfp-title"><%=movieName%></div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 class="no"><a href="#">12th</a></h4>
			                   	<p class="g_2"><a href="#"><%=movieName%></a></p>
			                   </div>
			                   <div class="clear"></div>
			               </div>		
					     </div>
				        <div class="clear"></div> 
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
