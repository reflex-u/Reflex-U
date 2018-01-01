<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="beans.Therapist"%>
<%@page import="conn.dbConnection"%>
<%@page import="java.sql.*"%>

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
	<div id="main">
                <!-- Post -->
                <section class="post">
                    <form method="post" action="UpdateTutorialEar" class="alt">
                        
                        <div class="row uniform">
                            <%
                                String id = request.getParameter("id");
                                //int id = Integer.parseInt(houseid);
                                out.print("<input type=\"hidden\" name=\"id\" value=\"" + id + "\">");

                                Connection conn = null;
                                try {
                                    conn = dbConnection.getConnection();

                                    String sql = "select * from tutorialear where id='" + id + "'";
                                    Statement stmt = conn.createStatement();
                                    ResultSet rset = stmt.executeQuery(sql);
                                    while (rset.next()) {
                            %>

                            <div class="6u 12u(xsmall)">
                                <label for="tutorialear">Name of Ailment</label>
                                <input type="text" name="name"  value="<%=rset.getString("name")%>">
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="tutorialear">Description</label>
                                <input type="text" name="description" value="<%=rset.getString("description")%>">
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="tutorialear">Steps</label>
                                <input type="text" name="steps"  value="<%=rset.getString("steps")%>">
                            </div>
                            
                            <%
                                }
                                } catch (Exception e) {
                                }
                            %> 

                            <div class="12u" >
                                <center><input type="submit" value="Update"/></center><br>
                            </div>
                            
                        </div>
                    </form>
                </section>
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