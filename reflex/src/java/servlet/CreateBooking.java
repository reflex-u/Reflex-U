/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.Booking;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import utils.DBUtils_Booking;
import utils.MyUtils;
import beans.Center;

@WebServlet(urlPatterns = {"/CreateBooking"})
public class CreateBooking extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public CreateBooking() {
        super();
    }

    // Show product creation page.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/createBooking.jsp");
        dispatcher.forward(request, response);
    }

    // When the user enters the user information, and click Submit.
    // This method will be called.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NullPointerException {
        Connection conn = MyUtils.getStoredConnection(request);

        String date = (String) request.getParameter("date");
        String startTime = (String) request.getParameter("startTime");
        String duration = (String) request.getParameter("duration");
        String name = (String) request.getParameter("name");
        String phoneNo = (String) request.getParameter("phoneNo");
        String email = (String) request.getParameter("email");
        String centerId = (String) request.getParameter("centerId");

        Booking booking = new Booking(date, startTime,duration, name, phoneNo, email, centerId);

        String errorString = null;

        if (errorString == null) {
            try {
                DBUtils_Booking.insertBooking(conn, booking);
            } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
            errorString = e.getMessage();
            PrintWriter out = response.getWriter();
            out.println("<p style='color: red;'>"+errorString+"</p>");}
        }

        // Store infomation to request attribute, before forward to views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("booking", booking);

        // If error, forward to Edit page.
        if (errorString != null) {
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/Error.jsp");
            dispatcher.forward(request, response);
        } // If everything nice.
        // Redirect to the product listing page.
        else {
            response.sendRedirect(request.getContextPath() + "/BookingList");
        }
    }
}
