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

@MultipartConfig(fileSizeThreshold=1024*1024*2, 
maxFileSize=1024*1024*10, 
maxRequestSize=1024*1024*50)
 
public class CreateTutorialHand extends HttpServlet {
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
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String steps = request.getParameter("steps");
        String video = request.getParameter("video");        
        
        try (PrintWriter out1 = response.getWriter()) {
            String unname = request.getParameter("unname");
            Part filePart = request.getPart("filecover");
            
            String photo="";
            String path= getServletContext().getRealPath("/imagehand");
            path = path.replaceAll("build\\\\web", "web");
            File file=new File(path);
            out1.print(path);
            file.mkdir();
            String fileName = getFileName(filePart);
                     
            OutputStream out = null;
          
            InputStream filecontent = null;
            
            PrintWriter writer = response.getWriter();
            try {    
                
                out = new FileOutputStream(new File(path + File.separator
                + name +".jpg"));
                
                filecontent = filePart.getInputStream();
                
                int read = 0;
                final byte[] bytes = new byte[1024];

                while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
           
                photo = path+"/"+name +".jpg";
                }
 
            Connection conn = null;
                try {
                    conn = dbConnection.getConnection();
                } catch (Exception e) {
                    out1.println("Unable to connect to database<br>");
                }
                
            String sql1 = "Select * from tutorialhand";
                Statement stmt = conn.createStatement();
                ResultSet rset = stmt.executeQuery(sql1);
                int count = 1;
                while (rset.next()) {
                count++;
                }
                String id = String.valueOf(count);

            PreparedStatement stmt2 = null;
            String sql2 = "INSERT into tutorialhand values (?,?,?,?,?)";
            stmt2 = conn.prepareStatement(sql2);


            stmt2.setString(1, id);
            stmt2.setString(2, name);
            stmt2.setString(3, description);
            stmt2.setString(4, steps);
            stmt2.setString(5, video);

            stmt2.executeUpdate();
            Boolean stat = true;
            if (stat == true)
            {
                response.sendRedirect("hand.jsp");
            }


         }
         catch(Exception e)
         {

         }
         out1.println ("<html><body><script>alert('Sucessfully Saved! Check the database and the path!');</script></body></html>");
            }
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}