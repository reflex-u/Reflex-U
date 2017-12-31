<%-- 
    Document   : centerList
    Created on : Dec 31, 2017, 3:47:57 AM
    Author     : Shameera
--%>

<%@page import="conn.MySQL"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="beans.*"%>
<%@page import="conn.dbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>


<html>
    <head>
        <title>REFLEX-U</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <style> 
            input[type=text] {
                width: 130px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                background-color: white;
                background-position: 10px 10px; 
                background-repeat: no-repeat;
                padding: 12px 20px 12px 40px;
                -webkit-transition: width 0.4s ease-in-out;
                transition: width 0.4s ease-in-out;
            }
            input[type=text]:focus {
                width: 100%;
            }
        </style>
    </head>
    <body class="homepage">

        <div id="page-wrapper">
            <!-- Header -->
            <div id="header">

                <!-- Inner -->
                <div class="inner">


                    <jsp:include page="find.jsp"></jsp:include>


                    </div>

                    <!-- Nav -->
                    <nav id="nav">
                    <%  Therapist therapist = (Therapist) session.getAttribute("therapist");
                    Patient patient = (Patient) session.getAttribute("patient");
                    if (patient != null) {
                        out.print("<ul>");
                        out.print("<li><a href='home.jsp'>Tutorial</a><li>");
                        out.print("<li><a href='forumList.jsp'>Forum</a></li>");
                        out.print("<li><a href='findCenter.jsp'>Navigation</a>");
                        out.print("<li><a href='SignOutServlet'>Logout</a></li>");
                        out.print("</ul>");
                    } else if (therapist != null) {
                        out.print("<ul>");
                        out.print("<li><a href='#'>Manage Tutorial</a>");
                        out.print("<ul>");
                        out.print("<li><a href='foot.jsp'>Foot Tutorial</a></li>");
                        out.print("<li><a href='hand.jsp'>Hand Tutorial</a></li>");
                        out.print("<li><a href='ear.jsp'>Ear Tutorial</a></li>");
                        out.print("</ul></li>");
                        out.print("<li><a href='#'>Join Forum</a></li>");
                        out.print("<li><a href='#'>Navigation & Center</a>");
                        out.print("<ul>");
                        out.print("<li><a href='findCenter.jsp'>Find Center</a></li>");
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

                <!-- Features -->
                <div class="wrapper style1">

                    <section id="features" class="container special">

                        <table class="">

                            <tr >

                                <td><b>Name</b></td>
                                <td><b>Address</b></td>
                                <td><b>Contact No</b></td>

                            </tr>
                            <%                                int count = 0;
                                String color = "#F9EBB3";
                                if (request.getAttribute("city") != null) {
                                    ArrayList al = (ArrayList) request.getAttribute("city");
                                    System.out.println(al);
                                    Iterator itr = al.iterator();
                                    while (itr.hasNext()) {

                                        if ((count % 2) == 0) {
                                            color = "#eeffee";
                                        }
                                        count++;
                                        ArrayList center = (ArrayList) itr.next();
                            %>
                            <tr>
                                <td><a href="createBooking.jsp"><%=center.get(2)%></a></td>
                                <td><a href="https://www.google.com/maps/search/+<%=center.get(3)%>"><%=center.get(3)%></a></td>
                                <td><a href="https://api.whatsapp.com/send?phone=6<%=center.get(4)%>"><%=center.get(4)%></a></td>

                            </tr>
                            <%
                                    }
                                }
                                if (count == 0) {
                            %>
                            <tr>
                                <td colspan="3"><b>No Record Found..</b></td>
                            </tr>
                            <%            }
                            %>
                        </table>
                    </section>


                </div>

                </section>


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
