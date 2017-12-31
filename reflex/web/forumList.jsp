<!DOCTYPE HTML>
<!--
        Helios by HTML5 UP
        html5up.net | @ajlkn
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Sharing Board</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <style>
            /* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    -webkit-animation-name: fadeIn; /* Fade in the background */
    -webkit-animation-duration: 0.4s;
    animation-name: fadeIn;
    animation-duration: 0.4s
}

/* Modal Content */
.modal-content {
    position: fixed;
    bottom: 0;
    background-color: #fefefe;
    width: 100%;
    -webkit-animation-name: slideIn;
    -webkit-animation-duration: 0.4s;
    animation-name: slideIn;
    animation-duration: 0.4s
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

/* Add Animation */
@-webkit-keyframes slideIn {
    from {bottom: -300px; opacity: 0} 
    to {bottom: 0; opacity: 1}
}

@keyframes slideIn {
    from {bottom: -300px; opacity: 0}
    to {bottom: 0; opacity: 1}
}

@-webkit-keyframes fadeIn {
    from {opacity: 0} 
    to {opacity: 1}
}

@keyframes fadeIn {
    from {opacity: 0} 
    to {opacity: 1}
}
        </style>

        <%
            ResultSet rset = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reflex?useSSL=false", "root", "1234");
                String sql = "SELECT * FROM forum join forumdetails on forum.forumId = forumdetails.forumId";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
</head>
<body>
    <div id="page-wrapper">

        <!-- Header -->
        <div id="header">

            <!-- Inner -->
            <div class="inner">
                <header>
                    <h1><a href="index.html" id="logo">FORUM LIST</a></h1>
                </header>
            </div>

            <!-- Nav -->
            <nav id="nav">
                <ul>
                    <li><a href="index.html">Home</a></li>
                    
                    <li><a href="left-sidebar.html">Tutorial</a></li>
                    <li><a href="right-sidebar.html">Forum</a></li>
                    <li><a href="no-sidebar.html">Navigation</a></li>
                </ul>
            </nav>

        </div>

        <!-- Main -->
        <div class="wrapper style">

            <div class="container">
                       <table class="table-striped">
                        <%
                            String forumid = "";
                            while (rset.next()) {
                                String title = rset.getString("forumTitle");
                                String starter = rset.getString("startUser");
                                String fId = rset.getString("forumId");
                                if (!forumid.equals(fId)) {
                                    forumid = fId;
                        %>
                        <tr>
                            <td rowspan="2"><%out.print("<a href='forumThread.jsp?forumid=" + fId + "&forumtitle=" + title + "'>" + title + "</a>");%>
                            <td>Start date: <%=rset.getString("startDate")%>
                        </tr>
                        <tr>
                            <td>Start by: <%=starter%>
                        </tr>

                        <%
                                }
                            }
                        %>
                        <tr>
                            <td>&nbsp;
                        </tr>
                        <tr>
                            <td>
                        </tr>
                        <tr>
                            <td rowspan="2">Cramp
                            <td>Start date: 2017-11-30 20:25:00
                        </tr>
                        <tr>
                            <td>Start by: Mae
                        </tr>
                        <tr>
                            <td>&nbsp;
                        </tr>
                        <tr>
                            <td>

                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reflex-u?useSSL=false", "root", "1234");
                String sql = "SELECT * FROM forum join forumdetails on forum.forumId = forumdetails.forumId";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
</head>
<body>
    <div id="page-wrapper">

        <!-- Header -->
        <div id="header">

            <!-- Inner -->
            <div class="inner">
                <header>
                    <h1><a href="index.html" id="logo">FORUM LIST</a></h1>
                </header>
            </div>

            <!-- Nav -->
            <nav id="nav">
                <ul>
                    <li><a href="index.html">Home</a></li>
                    
                    <li><a href="left-sidebar.html">Tutorial</a></li>
                    <li><a href="right-sidebar.html">Forum</a></li>
                    <li><a href="no-sidebar.html">Navigation</a></li>
                </ul>
            </nav>

        </div>

        <!-- Main -->
        <div class="wrapper style">

            <div class="container">
                       <table class="table-striped">
                        <%
                            String forumid = "";
                            while (rset.next()) {
                                String title = rset.getString("forumTitle");
                                String starter = rset.getString("startUser");
                                String fId = rset.getString("forumId");
                                if (!forumid.equals(fId)) {
                                    forumid = fId;
                        %>
                        <tr>
                            <td rowspan="2"><%out.print("<a href='forumThread.jsp?forumid=" + fId + "&forumtitle=" + title + "'>" + title + "</a>");%>
                            <td>Start date: <%=rset.getString("startDate")%>
                        </tr>
                        <tr>
                            <td>Start by: <%=starter%>
                        </tr>

                        <%
                                }
                            }
                        %>
                        
                        <tr>
                            <td rowspan="2">Cramp
                            <td>Start date: 2017-11-30 20:25:00
                        </tr>
                        <tr>
                            <td>Start by: Mae
                        </tr>
                        

                        <tr>
                            <td rowspan="2">Backpain
                            <td>Start date: 2017-12-01 01:00:50
                        </tr>
                        
                        <tr>
                            <td>Start by: Ain
                        </tr>
                    </table>
                        
                    <button id="myBtn">New Forum</button>

                    <div id="myModal" class="modal">

                        <!-- Modal content -->
                        <div class="modal-content">
                            <span class="close">&times;</span>
                            <form method="post" action="createForum">
                                Forum title:<input type="text" name="forumTitle">
                                Forum Description<textarea type="text" name="forumContent"></textarea>
                                Your name:<input type="text" name="user">
                                <input type="submit" value="Add Forum">
                            </form>
                        </div>

                    </div>
                    
                   

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

                </div>
                        
                  
                    </div>
                   
                </div>

            </div>



         <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
