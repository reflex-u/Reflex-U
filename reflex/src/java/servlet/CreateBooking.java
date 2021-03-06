/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import conn.dbConnection;
import java.io.*;
import javax.servlet.annotation.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.*;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)

@WebServlet(urlPatterns = {"/CreateBooking"})
public class CreateBooking extends HttpServlet {

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");

        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String date = request.getParameter("date");
        String startTime = request.getParameter("startTime");
        String duration = request.getParameter("duration");
        String name = request.getParameter("name");
        String phoneNo = request.getParameter("phoneNo");
        String email = request.getParameter("email");
        String centerName = request.getParameter("centerName");
        String errorString = null;
        try {

            

            Connection conn = null;
            try {
                conn = dbConnection.getConnection();
            } catch (Exception e) {
                errorString = e.getMessage();
            }

            String sql1 = "Select * from booking";
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(sql1);
            int count = 1;
            while (rset.next()) {
                count++;
            }
            

            PreparedStatement stmt2 = null;
            String sql2 = "INSERT into booking values (?,?,?,?,?,?,?)";
            stmt2 = conn.prepareStatement(sql2);

            stmt2.setString(1, date);
            stmt2.setString(2, startTime);
            stmt2.setString(3, duration);
            stmt2.setString(4, name);
            stmt2.setString(5, phoneNo);
            stmt2.setString(6, email);
            stmt2.setString(7, centerName);

            stmt2.executeUpdate();
            Boolean stat = true;
            if (stat == true) {
                response.sendRedirect("bookingListPT.jsp");
            }

        } catch (Exception e) {
            errorString = e.getMessage();
        }

    }
}


