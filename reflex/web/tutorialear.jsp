<!DOCTYPE HTML>
<!--
	Helios by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page import="conn.MySQL"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="beans.*"%>
<%@page import="conn.dbConnection"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<title>Tutorial</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body class="right-sidebar">
            
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
                <%  
                    Patient patient = (Patient) session.getAttribute("patient");
                    if (patient != null) {
                        out.print("<ul>");
                        out.print("<li><a href='home.jsp'>Tutorial</a><li>");
                        out.print("<li><a href='#'>Forum</a></li>");
                        out.print("<li><a href='#'>Navigation</a></li>");
                        out.print("<li><a href='SignOutServlet'>Logout</a></li>");
                        out.print("</ul>");
                    } else {
                        out.print("<ul>");
                        out.print("<li><a href='index.html'>Home</a></li>");
                        out.print("</ul>");
                    }
                 %>
            </nav>

	</div>

	<!-- Main -->
	<div class="wrapper style1">

            <div class="container">
		<div class="row 200%">
                       
                <%
                    String id = request.getParameter("id");
                    out.print("<input type=\"hidden\" name=\"id\" value=\"" + id + "\">");

                    Connection conn = null;
                    try {
                        conn = dbConnection.getConnection();

                        String sql = "select * from tutorialear where id='" + id + "'";
                        Statement stmt = conn.createStatement();
                        ResultSet rset = stmt.executeQuery(sql);
                        while (rset.next()) {
                %>
                    
                    <div class="8u 12u(mobile)" id="content">
			<article id="main">
                            <header>
                                <h2><a>Ear Reflexology</a></h2>
                                <h3><a>- <%=rset.getString("name")%> -</a></h3>
                            </header>
                            <%                                    
                                out.print("<img src=\"imageear/" + rset.getString("name") + ".jpg\" alt=\"\" />");
                            %>
                            
                            <p><%=rset.getString("description")%></p>
                                
                            <section>
				<header>
                                    <h3>Step by step</h3>
				</header>
				<p><%=rset.getString("steps")%></p><br><br>
                            </section>                                                                        
			</article>
                    </div>
                            
                    <!--SIDEBAR-->
                    <div class="4u 12u(mobile)" id="sidebar">
			<section>
                            <header>
                                <center><h3><a>EAR FUN FACTS</a></h3><br></center>
                            </header>
                            <div class="row 50%">
				<div class="12u">
                                    <p>	
                                        *Despite its small size, ears has more than 20,000 hair cells. 
                                    </p>
				</div>
                            </div>
                            <div class="row 50%">
				<div class="12u">
                                    <p>	
                                        *Your ears don't stop hearing when you sleep. Your brain chooses to ignore sound.
                                    </p>
				</div>
                            </div>
                            <div class="row 50%">
				<div class="12u">
                                    <p>	
                                        *Ears self-clean. You do not need to clean the wax out of your ears unless you have an abnormal condition. 
                                        Ears push the excess wax out as needed.
                                    </p>
				</div>
                            </div>
                            <div class="row 50%">
				<div class="12u">
                                    <p>	
                                        *Your ears have the smallest bones found in the human body.
                                    </p>
				</div>
                            </div>
			</section>
                    </div>
                
                <%
                    }
                    } catch (Exception e) {
                    }
                %> 
                
		</div>
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