
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/main.css" />

        <%
            ResultSet rset = null;
            String fId = request.getParameter("forumid");
            String fTitle = request.getParameter("forumtitle");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reflex?useSSL=false", "root", "1234");
                //          if(!connection.isClosed())
                //               out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                //          connection.close();
                String sql = "Select * from forum join forumdetails on forum.forumId = forumdetails.forumId join user on forum.sender = user.username where forum.forumId ='" + fId + "'";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

        <style>
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
    </head>
    <body>

        <div class="wrapper">
            <div class="inner">

        <div id="page-wrapper">


                <h2 class="major"><%=fTitle%></h2>

                <%
                    while (rset.next()) {
                        if (rset.isFirst()) {
                

                %>
                <table style="margin-bottom:5px;">
                    <tr>
                        <td rowspan="3" style="width:200px"><%=rset.getString("sender")%><br>
                            <%=rset.getString("userType")%>
                        <td colspan="3"><%=rset.getString("conversationContent")%>
                    </tr>                  
                    <tr>                        
                        <td>Created on:
                        <td><%=rset.getString("startDate")%>
                        <td align="right">#<%=rset.getString("conversationId")%>
                    </tr> 
                    <tr>
                            <td>&nbsp;
                        </tr>
                        <tr>
                            <td>
                        </tr>
                </table>                 
                <%
                } else {
                %>
                <table style="margin-bottom:5px">
                    <tr>
                        <td rowspan="3" style="width:200px"><%=rset.getString("sender")%><br>
                            <%=rset.getString("userType")%>
                        <td colspan="3"><%=rset.getString("conversationContent")%>

                    </tr>  
                    <tr>
                         <td>Replied on:
                        <td><%=rset.getString("conversationDate")%>
                        <td align="right">#<%=rset.getString("conversationId")%>
                    </tr> 
                    <tr>
                            <td>&nbsp;
                        </tr>
                        <tr>
                            <td>
                        </tr>
                </table>
                <%
                        }
                    }
                %>
                
                <br>
                <br>
                <br>                

                <div class="row unifrom inner">
                    <button id="myBtn">Reply</button>
                    <a href="forumList.jsp" class="button">Back</a>
                </div>


                <div id="myModal" class="modal">

                    <!-- Modal content -->
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <p>
                        <h1>Reply to: <%=fTitle%></h1>
                        <form action="forumReply">
                            <%
                                out.print("<input type=\"hidden\" name=\"forumId\" value=" + fId + ">");
                            %>
                            <textarea style="margin-bottom:5px" name="reply"></textarea>
                            Your name:<input type="text" name="user">
                            <input type="submit" value="reply">
                        </form>
                        </p>
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
    </body>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.scrollex.min.js"></script>
    <script src="assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="assets/js/main.js"></script>

    
</html>
