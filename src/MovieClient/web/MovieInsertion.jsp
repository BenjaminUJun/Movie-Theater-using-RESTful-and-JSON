<%-- 
    Document   : MovieInsertion
    Created on : Aug 10, 2015, 13:29:17 PM
    Author     : Hugh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <title>My Movie Theater | Add Movie</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
        <link rel="stylesheet" href="FrontEnd/AddMovie/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="FrontEnd/AddMovie/assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="logo span4">
                        <h1><a href="">My Movie Theater<span class="red">.</span></a></h1>
                    </div>
                    <div class="links span8">
                        <a class="home" href="index.jsp" rel="tooltip" data-placement="bottom" data-original-title="Home"></a>
                        <!--a class="blog" href="" rel="tooltip" data-placement="bottom" data-original-title="Blog"></a -->
                    </div>
                </div>
            </div>
        </div>

        <div class="register-container container">
            <div class="row" >
                <div class="iphone span5">
                    <img src="FrontEnd/AddMovie/assets/img/Pride.jpeg" alt="">
                </div>
                <div class="register span6">
                    <form action="MovieInsertionServlet" method="post" name="Add Movie">
                        <h2>Add Movie <span class="red"><strong>Information</strong></span></h2>
                        <label for="txt0">Movie Name</label>
                        <input type="text" id="txt0" name="txt0" placeholder="enter movie name...">
                        <label for="txt1">Director</label>
                        <input type="text" id="txt1" name="txt1" placeholder="enter director name...">
                        <label for="txt2">Producer</label>
                        <input type="text" id="txt2" name="txt2" placeholder="enter producer name...">
                        <label for="txt3">Stars</label>
                        <input type="text" id="txt3" name="txt3" placeholder="enter stars name...">
                        <label for="txt4">Writers</label>
                        <input type="text" id="txt4" name="txt4" placeholder="enter writers name...">
                        <label for="txt5">Rating</label>
                        <input type="text" id="txt5" name="txt5" placeholder="enter your rating...">
                        <label for="txt6">Rank</label>
                        <input type="text" id="txt6" name="txt6" placeholder="enter the rank...">
                        <label for="txt8">Duration</label>
                        <input type="text" id="txt8" name="txt8" placeholder="enter the duration...">
                        <label for="txt7">Movie Genre</label>
                        <input type="text" id="txt7" name="txt7" placeholder="enter movie genre...">
                        <label for="txt9">Movie Pic URL (Enter "NO" if not have ONE)</label>
                        <input type="text" id="txt9" name="txt9" placeholder="enter movie pic url...">
                        <button type="submit" name="searchmoviebutton">Submit</button>
                    </form>
                </div>
            </div>
        </div>
		<div align="center">Copyright &copy; 2015.Made by Hugh All rights reserved.
        </div>
        <!-- Javascript -->
        <script src="FrontEnd/AddMovie/assets/js/jquery-1.8.2.min.js"></script>
        <script src="FrontEnd/AddMovie/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="FrontEnd/AddMovie/assets/js/jquery.backstretch.min.js"></script>
        <script src="FrontEnd/AddMovie/assets/js/scripts.js"></script>

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
