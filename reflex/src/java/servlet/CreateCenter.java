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

/**
 *
 * @author Shameera
 */
@WebServlet(urlPatterns = {"/CreateCenter"})
public class CreateCenter extends HttpServlet {

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
        String city = request.getParameter("city");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String contactNo = request.getParameter("contactNo");

        String errorString = null;
        try {

            Connection conn = null;
            try {
                conn = dbConnection.getConnection();
            } catch (Exception e) {
                errorString = e.getMessage();
            }

            String sql1 = "Select * from center";
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(sql1);
            int count = 1;
            while (rset.next()) {
                count++;
            }

            PreparedStatement stmt2 = null;
            String sql2 = "INSERT into center values (?,?,?,?)";
            stmt2 = conn.prepareStatement(sql2);

            stmt2.setString(1, city);
            stmt2.setString(2, name);
            stmt2.setString(3, address);
            stmt2.setString(4, contactNo);

            stmt2.executeUpdate();
            Boolean stat = true;
            if (stat == true) {
                response.sendRedirect("home.jsp");
            }

        } catch (Exception e) {
            errorString = e.getMessage();
        }
    }
}
