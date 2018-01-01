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
                    <h1><a id="logo">Add New Center</a></h1>
                </header>
            </div>
            
            <!-- Nav -->
            <nav id="nav">
                <%Therapist thrapist = (Therapist) session.getAttribute("therapist"); %>
                <%Center center = (Center) session.getAttribute("center"); %>
                
                <ul>
                    <li><a href="home.jsp">Manage Tutorial</a>
                    <ul>
                        <li><a href="foot.jsp">Foot Tutorial</a></li>
                        <li><a href="hand.jsp">Hand Tutorial</a></li>
                        <li><a href="ear.jsp">Ear Tutorial</a></li>
                    </ul>
                    </li>
                    <li><a href="forumList.jsp">Join Forum</a></li>
                    <li><a href="#">Navigation & Center</a>
                    <ul>
                        <li><a href="findCenter.jsp">Find Center</a></li>
                        <li><a href="createCenter.jsp">Add Center</a></li>
                    </ul>
                    </li>
                    <li><a href="SignOutServlet">Logout</a></li>
                </ul>
            </nav>

	</div>
        
        <!-- Main -->
	<div class="wrapper style1">
            <div class="container">
		<article id="main" class="special">
                
                    <section class="post">
                    <form method="post" action="CreateCenter" enctype="multipart/form-data" class="alt">
                        <div class="row uniform">
                            
                            <div class="6u 12u(xsmall)">
                                <label for="city">City</label>
                                <input type="text" id="city" />
                            </div>                          
                            <div class="6u 12u(xsmall)">
                                <label for="name">Name</label>
                                <input type="text" id="name" />
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="address">Address</label>
                                <input type="text" id="address" />
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="contactNo">Contact No</label>
                                <input type="text" id="contactNo" />
                            </div>
                            
                            <div class="12u" >
                                <center><input type="submit" value="Add"/></center>
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