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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
	<title>Tutorial</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="assets/css/main.css" />
    </head>
        
    <body class="no-sidebar">
        <%

            ResultSet rset = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = MySQL.getMySQLConnection();
                
                String sql = null;
                String search = request.getParameter("search");
                String ailment = request.getParameter("ailment");
                
                if (search == null) {
                    sql = "Select * from tutorialear";
                } else if (search.equals("1")) {
                    sql = "Select * from tutorialear where name like '%" + ailment + "%'";
                }
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);

            } catch (Exception ex) {
                out.println("Unable to connect to database.");
            }

        %>
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
                <%  Therapist therapist = (Therapist) session.getAttribute("therapist");
                    Patient patient = (Patient) session.getAttribute("patient");
                        if (patient != null) {
                            out.print("<ul>");
                            out.print("<li><a href='home.jsp'>Tutorial</a><li>");
                            out.print("<li><a href='forumList.jsp'>Forum</a></li>");
                            out.print("<li><a href='#'>Navigation & Booking</a>");
                            out.print("<ul>");
                            out.print("<li><a href='bookingListPt.jsp'>Booking Status</a></li>");
                            out.print("<li><a href='findCenter.jsp'>Find Center</a></li>");
                            out.print("</ul></li>");
                            out.print("<li><a href='SignOutServlet'>Logout</a></li>");
                            out.print("</ul>");
                        } else if (therapist != null) {
                            out.print("<ul>");
                            out.print("<li><a href='home.jsp'>Manage Tutorial</a>");
                            out.print("<ul>");
                            out.print("<li><a href='foot.jsp'>Foot Tutorial</a></li>");
                            out.print("<li><a href='hand.jsp'>Hand Tutorial</a></li>");
                            out.print("<li><a href='ear.jsp'>Ear Tutorial</a></li>");
                            out.print("</ul></li>");
                            out.print("<li><a href='#'>Join Forum</a></li>");
                            out.print("<li><a href='#'>Navigation & Center</a>");
                            out.print("<ul>");
                            out.print("<li><a href='findCenter.jsp'>Find Center</a></li>");
                            out.print("<li><a href='updateCenter.jsp'>Update Center</a></li>");
                            out.print("<li><a href='createCenter.jsp'>Add Center</a></li>");
                            out.print("</ul></li>");
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
            
            <!-- Post for Patient -->
                <%
                    if (patient != null) {

                %>

			<!-- Main -->
				<div class="wrapper style1">
                                    <div class="container">
					<article id="main" class="special">
                                            <header>
						<h2><a>Ear Reflexology</a></h2>
						<p>
                                                    Ear reflexology is not as well-known as foot or hand reflexology, but it is just as effective for 
                                                    relieving stress and pain. Application of ear reflexology is fast and easy. 
                                                    It is ideal to use when other health conditions make the more traditional reflex therapies unsuitable.
						</p>
                                            </header>
                                            <center><a class="image featured"><img src="images/ear.jpg" alt="" style="width:80%; height:50%;"/></a></center>
					</article>
                                    </div>
				</div>
                        
                        <!-- Carousel -->
                                <section class="carousel">
                                <section>
					<header>
                                            <center><h3>Type of ailment</h3></center>
					</header>
                                        <form action="ear.jsp">
                                            <center>
                                                <input type="hidden" name="search" value="1">
                                                <div class="6u 12u(small)"><input type="text" name="ailment" size="5" placeholder="Search"> </div>
                                            </center>
                                        </form>
                                </section>
                                    
                                <div class="reel">
                                    <section class="post">

                                    <% int count = 1;
                                        while (rset.next()) {
                                    %>
                                    
                                    <article>
                                        <a class="image fit" >
                                            <%                                    
                                                out.print("<img src=\"imageear/" + rset.getString("name") + ".jpg\" alt=\"\" />");
                                            %>
                                        </a>
                                        <header>
                                            <% 
                                                out.print("<a href='tutorialear.jsp?id=" + rset.getString("id") + "'>"); 
                                            %>
                                            <%= rset.getString("name") %>
                                            <% 
                                                out.print("</a>"); 
                                            %>
                                        </header>
                                    </article>
                                            
                                    <% count++;
                                        }
                                        if (count == 1) {
                                            out.print("<b>There is no ailment with that name yet</b>");
                                        }
                                    %>
                                    </section>
                                </div>
                                </section>

                <%
                } else if (therapist != null) {
                %>
                
                        <!-- Main -->
				<div class="wrapper style1">
                                    <div class="container">
					<article id="main" class="special">
                                            <header>
						<h2><a>Ear Reflexology</a></h2>
                                            </header>
                                        <form action="ear.jsp">
                                            <center><a href="createTutorialEar.jsp" class="button"> ADD</a></center>
                                        </form>
                                        </article>
                                    </div>
				</div>
                        
                                <section class="carousel">
                                <section>
					<header>
                                            <center><h3>Type of ailment</h3></center>
					</header>
                                        <form action="ear.jsp">
                                            <center>
                                                <input type="hidden" name="search" value="1">
                                                <div class="6u 12u(small)"><input type="text" name="ailment" size="5" placeholder="Search"> </div>
                                            </center>
                                        </form>
                                </section> 
                                    
                                <div class="reel">
                                <section class="post">

                                    <% int count = 1;
                                        while (rset.next()) {
                                    %>
                                        
                                    <article><center>
                                        <div class="6u 12u(small)">

                                            <br>
                                            <h3> <%= rset.getString("name")%> </h3><br>
                                            <ul>
                                                <li><% out.print("<li><a href='editTutorialEar.jsp?id=" + rset.getString("id") + "' class=\"button\">EDIT</a></li>"); %></li>
                                                <li><% out.print("<li><a href='DeleteTutorialEar?id=" + rset.getString("id") + "' class=\"button\">DELETE</a></li>"); %></li>
                                            </ul>
                                            <br>

                                        </div></center>
                                    </article>
                                                
                                    <% count++;
                                        }
                                        if (count == 1) {
                                            out.print("<b>There is no ailment with that name yet</b>");
                                        }
                                    %>
                                    
                                </section>
                                </div> 
                                </section>
                
                <%
                    } else {
                %>
                
                        <!-- Main -->
				<div class="wrapper style1">
                                    <div class="container">
					<article id="main" class="special">
                                            <header>
						<h2><a>Ear Reflexology</a></h2>
						<p>
                                                    Ear reflexology is not as well-known as foot or hand reflexology, but it is just as effective for 
                                                    relieving stress and pain. Application of ear reflexology is fast and easy. 
                                                    It is ideal to use when other health conditions make the more traditional reflex therapies unsuitable.
						</p>
                                            </header>
                                            <center><a class="image featured"><img src="images/ear.jpg" alt="" style="width:80%; height:50%;"/></a></center>
					</article>
                                    </div>
				</div>
                        
                        <!-- Carousel -->
                                <section class="carousel">
                                <section>
					<header>
                                            <center><h3>Type of ailment</h3></center>
					</header>
                                        <form action="ear.jsp">
                                            <center>
                                                <input type="hidden" name="search" value="1">
                                                <div class="6u 12u(small)"><input type="text" name="ailment" size="5" placeholder="Search"> </div>
                                            </center>
                                        </form>
                                </section>
                                    
                                <div class="reel">
                                    <section class="post">

                                    <% int count = 1;
                                        while (rset.next()) {
                                    %>
                                    
                                    <article>
                                        <a class="image fit" >
                                            <%                                    
                                                out.print("<img src=\"imageear/" + rset.getString("name") + ".jpg\" alt=\"\" />");
                                            %>
                                        </a>
                                        <header>
                                            <% 
                                                out.print("<a href='tutorialear.jsp?id=" + rset.getString("id") + "'>"); 
                                            %>
                                            <%= rset.getString("name") %>
                                            <% 
                                                out.print("</a>"); 
                                            %>
                                        </header>
                                    </article>
                                            
                                    <% count++;
                                        }
                                        if (count == 1) {
                                            out.print("<b>There is no ailment with that name yet</b>");
                                        }
                                    %>
                                    </section>
                                </div>
                                </section>
                                    
                <%
                    } 
                %>
                
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