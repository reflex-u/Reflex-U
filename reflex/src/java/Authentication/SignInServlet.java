package Authentication;

import conn.MySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Therapist;
import beans.Patient;

public class SignInServlet extends HttpServlet {
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
 
response.setContentType("text/html");
try (PrintWriter out = response.getWriter()) {
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String level = request.getParameter("level");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con;
        con = MySQL.getMySQLConnection();
        
        if(level.equals("therapist")){
        PreparedStatement pst = con.prepareStatement("Select * from therapist where email=? and password=?");
        pst.setString(1, email);
        pst.setString(2, password);
        
        ResultSet rs = pst.executeQuery();   
        Therapist therapist = new Therapist();
        
        HttpSession session = request.getSession();
        if (session != null) {
                        session.invalidate();
                        session = request.getSession();
                    }
        
        session.setAttribute("therapist", therapist);
        if(rs.next())   
        {
           response.sendRedirect("home.jsp");     
        }
        else
           response.sendRedirect("index.html");
        }
        
        else if(level.equals("patient")){
        PreparedStatement pst = con.prepareStatement("Select * from patient where email=? and password=?");
        pst.setString(1, email);
        pst.setString(2, password);
        
        ResultSet rs = pst.executeQuery(); 
        Patient patient = new Patient();
        
        HttpSession session = request.getSession();
        if (session != null) {
                        session.invalidate();
                        session = request.getSession();
                    }
        
        session.setAttribute("patient", patient);
        if(rs.next())   
        {
           response.sendRedirect("home.jsp");     
        }
        else
           response.sendRedirect("index.html");
        }
    }
    catch (ClassNotFoundException | SQLException e2) {
        System.out.println(e2);
    }

} 

}}