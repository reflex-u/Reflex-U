package Authentication;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignUpServlet extends HttpServlet {
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
 
response.setContentType("text/html");
try (PrintWriter out = response.getWriter()) {
    String fullname = request.getParameter("fullname");
    String telno = request.getParameter("telno");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con;
        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/reflex-u", "root", "1234");
        
        PreparedStatement ps = con.prepareStatement("insert into patient values(?,?,?,?)");
        
        ps.setString(1, email);
        ps.setString(2, password);
        ps.setString(3, fullname);
        ps.setString(4, telno);
        
        int i = ps.executeUpdate();
        
        if (i > 0)
            response.sendRedirect("home.jsp");
        
    }
    catch (ClassNotFoundException | SQLException e2) {
        System.out.println(e2);
    }

} }

}