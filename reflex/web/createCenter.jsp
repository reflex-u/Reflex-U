<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="beans.Therapist"%>
<%@page import="beans.Center"%>

<html>
    <head>
	<title>Booking</title>
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
                    <h1><a id="logo">Booking A Session</a></h1>
                </header>
            </div>
            
            <!-- Nav -->
            <nav id="nav">
                <%Therapist thrapist = (Therapist) session.getAttribute("therapist"); %>
                <%Center center = (Center) session.getAttribute("center"); %>
                <ul>
                    <li><a href="home.jsp">Tutorial</a></li>
                    <li><a href="#">Join Forum</a></li>
                    <li><a href="findCenter.jsp">Navigation</a></li>
                    <li><a href="SignOutServlet">Logout</a></li>
                    </ul>
            </nav>

	</div>
        
        <!-- Main -->
	<div class="wrapper style1">
            <div class="container">
		<article id="main" class="special">
                
                    <section class="post">
                    <form method="post" action="CreateBooking" enctype="multipart/form-data" class="alt">
                        <div class="row uniform">
                            
                            <div class="6u 12u(xsmall)">
                                <label for="centerId">Center</label>
                                <input type="text" id="centerId" value="<%= session.getAttribute("id") %>" />
                            </div>                          
                            <div class="6u 12u(xsmall)">
                                <label for="name">Name</label>
                                <input type="text" id="name" value="<%= session.getAttribute("name") %>" />
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="phoneNo">Phone No</label>
                                <input type="text" id="phoneNo"  value="<%= session.getAttribute("telNo") %>" />
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="email">Email</label>
                                <input type="email" id="email"  value="<%= session.getAttribute("email") %>" />
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="date">Date</label>
                                <input type="date" name="date" id="date"/>
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="startTime">Start Time</label>
                                <input type="time" name="time" id="time"/>
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="duration">Duration</label>
                                <select name="duration"id="duration" size="3">
                                    <option>1 hr</option>
                                    <option>2 hrs</option>
                                    <option>3 hrs</option>
                                </select>
                            </div>
                            
                            <div class="12u" >
                                <center><input type="submit" value="Book"/></center>
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