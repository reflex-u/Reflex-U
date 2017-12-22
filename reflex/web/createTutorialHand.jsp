<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="beans.Therapist"%>

<html>
    <head>
	<title>Tutorial</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="assets/css/main.css" />
    </head>
        
    <body class="no-sidebar">
	<div id="page-wrapper">

	<!-- Header -->
	<div id="header">

            <!-- Inner -->
            <div class="inner">
                <header>
                    <h1><a id="logo">Reflexology Tutorial</a></h1>
                </header>
            </div>
            
            <!-- Nav -->
            <nav id="nav">
                <%Therapist therapist = (Therapist) session.getAttribute("therapist"); %>
                <ul>
                    <li><a href="#">Manage Tutorial</a>
                        <ul>
                            <li><a href="foot.jsp">Foot Tutorial</a></li>
                            <li><a href="hand.jsp">Hand Tutorial</a></li>
                            <li><a href="ear.jsp">Ear Tutorial</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Join Forum</a></li>
                    <li><a href="#">Manage Navigation</a></li>
                    <li><a href="SignOutServlet">Logout</a></li>
                    </ul>
            </nav>

	</div>
        
        <!-- Main -->
	<div class="wrapper style1">
            <div class="container">
		<article id="main" class="special">
                
                    <section class="post">
                    <form method="post" action="CreateTutorialHand" enctype="multipart/form-data" class="alt">
                        <div class="row uniform">
                                                      
                            <div class="6u 12u(xsmall)">
                                <label for="tutorialhand">Name of Ailment</label>
                                <input type="text" name="name"  value="" placeholder="eg. Anxiety">
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="tutorialhand">Description</label>
                                <input type="text" name="description"  value="" placeholder="Overview about ailment">
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="tutorialhand">Steps</label>
                                <input type="text" name="steps"  value="" placeholder="eg. 1.....<b>2.....<b>3.....">
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="tutorialhand">Picture</label>
                                <input type="file" name="filecover" value="Upload"/>
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="tutorialhand">Video</label>
                                (Copy this: "https://www.youtube.com/embed/" together with link from youtube)
                                <input type="text" name="video"  value="" placeholder="eg. https://www.youtube.com/embed/......">
                            </div>
                            
                            <div class="12u" >
                                <center><input type="submit" value="Create"/></center>
                            </div>

                        </div>
                    </form>
                    </section>
                    
                </article>
            </div>
	</div>
        
            <!-- Footer -->
            <div id="footer">
                    <div class="row">
                        <div class="12u">

                            <!-- Contact -->
                            <section class="contact">
                                <p>If you have a long-term medical problems, you are urged to seek the advice of a doctor.</p>
                                <ul class="icons">
                                    <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                                    <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                                    <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                                    <li><a href="#" class="icon fa-pinterest"><span class="label">Pinterest</span></a></li>
                                    <li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
                                    <li><a href="#" class="icon fa-linkedin"><span class="label">Linkedin</span></a></li>
                                </ul>
                            </section>

                            <!-- Copyright -->
                            <div class="copyright">
                                <ul class="menu">
                                    <li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                                </ul>
                            </div>

                        </div>

                    </div>
            </div>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.onvisible.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

    </body>
</html>