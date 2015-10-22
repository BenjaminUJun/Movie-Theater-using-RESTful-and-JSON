<%-- 
    Document   : MovieSentimentResults
    Created on : Aug 12, 2015, 1:21:00 PM
    Author     : Hugh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="servletslocal.Sentiment"%> 
<!DOCTYPE html>
<html>
    <head>
        <title>My Movie Theater | Sentiment</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <!--        <script src="FrontEnd/Standard/js/jquery.min.js"></script>-->
        <script type="text/javascript" src="FrontEnd/Sentiment/js/modules/jquery.min.js"></script>
        <script type="text/JavaScript" src="FrontEnd/Sentiment/js/highcharts.js"></script>
        <script type="text/JavaScript" src="FrontEnd/Sentiment/js/modules/exporting.js"></script>
    </head>
    <%
        String keyword = request.getParameter("keyword");
        double positive = 0.0;
        double negative = 0.0;
        double newpos = 0.0;
        double newneg = 0.0;
        try {
            positive = Sentiment.getPositiveProbability(keyword);
            negative = 1.0 - positive;
            newpos = (int) (positive * 100000) / 1000.0;
            newneg = (int) (negative * 100000) / 1000.0;
        } catch (Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
            out.println("exception" + ex);
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
                    <ul class="breadcrumb breadcrumb__t"><a class="home" href="SearchSentiment.jsp">Sentiment</a>  / Results</ul>
                    <div class="groupppp">
                        <script type="text/javascript">
                            var chart;
                            $(document).ready(function () {

                                chart = new Highcharts.Chart({
                                    chart: {
                                        renderTo: 'container',
                                        margin: [50, 200, 60, 170]
                                    },
                                    title: {
                                        text: 'Sentiment Analysis'
                                    },
                                    plotArea: {
                                        shadow: null,
                                        borderWidth: null,
                                        backgroundColor: null
                                    },
                                    tooltip: {
                                        formatter: function () {
                                            return '<b>' + this.point.name + '</b>: ' + this.y + ' %';
                                        }
                                    },
                                    plotOptions: {
                                        pie: {
                                            allowPointSelect: true,
                                            cursor: 'pointer',
                                            dataLabels: {
                                                enabled: true,
                                                formatter: function () {
                                                    if (this.y > 5)
                                                        return this.point.name;
                                                },
                                                color: 'white',
                                                style: {
                                                    font: '13px Trebuchet MS, Verdana, sans-serif'
                                                }
                                            }
                                        }
                                    },
                                    legend: {
                                        layout: 'vertical',
                                        style: {
                                            left: 'auto',
                                            bottom: 'auto',
                                            right: '50px',
                                            top: '100px'
                                        }
                                    },
                                    series: [{
                                            type: 'pie',
                                            name: 'Browser share',
                                            data: [
                                                ['Negative', <%=newneg%>],
                                                {
                                                    name: 'Positive',
                                                    y: <%=newpos%>,
                                                    sliced: true,
                                                    selected: true
                                                }
                                            ]
                                        }]
                                });
                            });
                        </script>
                        <div id="container" style="width: 900px; height: 500px; margin: 0 auto"></div>
                        <h2 >Movie Name : <%= keyword%></h2>
                        <h2>About <%=newpos%>% percentage of people like this movie,</h2>
                        <h2>while <%=newneg%>% percentage of people don't like it.</h2>
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
        <div style="display:none">
            <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
        </div>
    </body>
</html>
