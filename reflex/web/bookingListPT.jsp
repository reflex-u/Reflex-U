<%-- 
    Document   : bookingListPT
    Created on : Dec 31, 2017, 5:00:58 PM
    Author     : Shameera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reflex-U</title>
    </head>
    <body>
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

                    </div>

                    <!-- Nav -->
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

                    <!-- Features -->
                    <div class="wrapper style1">

                        <section id="features" class="container special">
                            <table table="event" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Date</th>
                                        <th>Start time </th>
                                        <th>Duration </th>
                                    </tr>

                                </thead>
                                <c:forEach items="${BookingList}" var="booking" >
                                    <tbody>

                                        <tr>
                                            <td>${booking.name}</td>
                                            <td>${booking.date}</td>
                                            <td>${booking.startTime}</td>
                                            <td>${booking.duration}</td>

                                            <td>
                                                <a href="EditBoking?courtid=${booking.id}"><img src="images/pencil-edit-button.png"></a>
                                                <a href="DeleteBooking?courtid=${booking.id}"><img src="images/rubbish-bin.png"></a>

                                            </td>
                                        </tr>


                                    </tbody>
                                </c:forEach>
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



</body>
</html>
