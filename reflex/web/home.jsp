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
                    <header>
                        <h1><a href="pIndex.jsp" id="logo">REFLEX-U</a></h1>
                        <hr />
                        <p>EVEN YOU CAN DO IT</p>
                    </header>
                    <footer>
                        <a href="#features" class="button circled scrolly">Start</a>
                    </footer>
                </div>

                <!-- Nav -->
                <nav id="nav">
                <%  Therapist therapist = (Therapist) session.getAttribute("therapist");
                    Patient patient = (Patient) session.getAttribute("patient");
                    if (patient != null) {
                        out.print("<ul>");
                        out.print("<li><a href='home.jsp'>Tutorial</a><li>");
                        out.print("<li><a href='forumList.jsp'>Forum</a></li>");
                        out.print("<li><a href='findCenter.jsp'>Navigation</a></li>");
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
                        out.print("<li><a href='createCenter.jsp'>Add Center</a></li>");
                        out.print("</ul></li>");
                        out.print("<li><a href='SignOutServlet'>Logout</a></li>");
                        out.print("</ul>");
                    } else {
                        out.print("<ul>");
                        out.print("<li><a href='home.jsp'>Tutorial</a><li>");
                        out.print("<li><a href='#'>Forum</a></li>");
                        out.print("<li><a href='findCenter.jsp'>Navigation</a></li>");
                        out.print("<li><a href='#'>EXPLORE MORE!</a>");
                        out.print("<ul>");
                        out.print("<li><a href='SignInServlet'>Sign-In</a></li>");
                        out.print("<li><a href='SignUp'>Sign-Up</a></li>");
                        out.print("</ul></li>");
                        out.print("</ul>");
                    } 
                %>
                </nav>

            </div>
                   
            <!-- Post for Patient -->
                <%
                    if (patient != null) {

                %>
                
            <!-- Features -->
            <div class="wrapper style1">

                <section id="features" class="container special">
                    <header>
                        <h2>REFLEXOLOGY TUTORIAL</h2>
                        <p>Everyone can learn how to do reflexology and read a reflexology chart, it is a universal therapeutic touch therapy, similar to massage.</p>
                        
                    </header>
                    <div class="row">
                        <article class="4u 12u(mobile) special">
                            <a href="foot.jsp" class="image featured"><img src="images/foott.jpg" width="500" height="377"/></a>
                            <header>
                                <h3><a href="foot.jsp">Foot Reflexology</a></h3>
                            </header>
                            <p>
                                Think about how much stress your feet go through each day. No body part is more abused than your feet. 
                                Standing, running, jumping ? our feet do it all! Reflexologists believe that overall health begins in your feet 
                                and travels up.
                            </p>
                        </article>
                        <article class="4u 12u(mobile) special">
                            <a href="hand.jsp" class="image featured"><img src="images/hand.jpg" width="500" height="377"/></a>
                            <header>
                                <h3><a href="hand.jsp">Hand Reflexology</a></h3>
                            </header>
                            <p>
                                We use hand reflexology mainly for do-it-yourself reflexology. Hand reflexology uses a completely 
                                different technique to foot reflexology. Mainly because the hands are very flexible and the reflexes 
                                are much deeper under the skin 
                            </p>
                        </article>
                        <article class="4u 12u(mobile) special">
                            <a href="ear.jsp" class="image featured"><img src="images/ear.jpg" width="500" height="377"/></a>
                            <header>
                                <h3><a href="ear.jsp">Ear Reflexology</a></h3>
                            </header>
                            <p>
                                Ear reflexology is not as well-known as foot or hand reflexology, but it is just as effective for 
                                relieving stress and pain. Application of ear reflexology is fast and easy. 
                            </p>
                        </article>
                    </div>
                </section>
            </div>
            
            <!-- Post for Therapist -->
                
                
            <!-- Post for New Patient -->
                <%
                    } else {
                %>
                
                <!-- Features -->
                <div class="wrapper style1">

                <section id="features" class="container special">
                    <header>
                        <h2>REFLEXOLOGY TUTORIAL</h2>
                        <p>Everyone can learn how to do reflexology and read a reflexology chart, it is a universal therapeutic touch therapy, similar to massage.</p>
                    </header>
                    <div class="row">
                        <article class="4u 12u(mobile) special">
                            <a href="foot.jsp" class="image featured"><img src="images/foott.jpg" width="500" height="377"/></a>
                            <header>
                                <h3><a href="foot.jsp">Foot Reflexology</a></h3>
                            </header>
                            <p>
                                Think about how much stress your feet go through each day. No body part is more abused than your feet. 
                                Standing, running, jumping ? our feet do it all! Reflexologists believe that overall health begins in your feet 
                                and travels up.
                            </p>
                        </article>
                        <article class="4u 12u(mobile) special">
                            <a href="hand.jsp" class="image featured"><img src="images/hand.jpg" width="500" height="377"/></a>
                            <header>
                                <h3><a href="hand.jsp">Hand Reflexology</a></h3>
                            </header>
                            <p>
                                We use hand reflexology mainly for do-it-yourself reflexology. Hand reflexology uses a completely 
                                different technique to foot reflexology. Mainly because the hands are very flexible and the reflexes 
                                are much deeper under the skin 
                            </p>
                        </article>
                        <article class="4u 12u(mobile) special">
                            <a href="ear.jsp" class="image featured"><img src="images/ear.jpg" width="500" height="377"/></a>
                            <header>
                                <h3><a href="ear.jsp">Ear Reflexology</a></h3>
                            </header>
                            <p>
                                Ear reflexology is not as well-known as foot or hand reflexology, but it is just as effective for 
                                relieving stress and pain. Application of ear reflexology is fast and easy. 
                            </p>
                        </article>
                    </div>
                </section>
                </div>
                
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
