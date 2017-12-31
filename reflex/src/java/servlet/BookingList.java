/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.Booking;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.DBUtils_Booking;
import utils.MyUtils;

/**
 *
 * @author Shameera
 */
@WebServlet(urlPatterns = {"/BookingList"})
public class BookingList extends HttpServlet {
private static final long serialVersionUID = 1L;
 
    public BookingList() {
        super();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
 
        String errorString = null;
        List<Booking> booking = null;
        try {
            booking = DBUtils_Booking.queryBooking(conn);
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
            errorString = e.getMessage();
            PrintWriter out = response.getWriter();
            out.println("<p style='color: red;'>"+errorString+"</p>");
        }
        // Store info in request attribute, before forward to views
        request.setAttribute("errorString", errorString);
        request.setAttribute("BookingList", booking);
         
        // Forward to 
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/bookingListPT.jsp");
        dispatcher.forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
