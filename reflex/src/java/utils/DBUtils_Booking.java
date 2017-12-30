/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import beans.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shameera
 */
public class DBUtils_Booking {
        public static Booking findBooking(Connection conn, String id) throws SQLException {

        String sql = "Select * from booking a where a.id = ? ";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);

        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            String date = rs.getString("date");
            String startTime = rs.getString("startTime");
            String duration = rs.getString("duration");
            String name = rs.getString("name");
            String phoneNo = rs.getString("phoneNo");
            String email = rs.getString("email");
            String centerId = rs.getString("centerId");
            Booking booking = new Booking();
            booking.setDate(date);
            booking.setStartTime(startTime);
            booking.setDuration(duration);
            booking.setName(name);
            booking.setPhoneNo(phoneNo);
            booking.setEmail(email);
            booking.setCenterId(centerId);
            return booking;
        }
        return null;
    }

    
    public static List<Booking> queryBooking(Connection conn) throws SQLException {
        String sql = "Select * from booking ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Booking> list = new ArrayList<>();
        while (rs.next()) {
            String date = rs.getString("date");
            String startTime = rs.getString("startTime");
            String duration = rs.getString("duration");
            String name = rs.getString("name");
            String phoneNo = rs.getString("phoneNo");
            String email = rs.getString("email");
            String centerId = rs.getString("centerId");
            Booking booking = new Booking();
            booking.setDate(date);
            booking.setStartTime(startTime);
            booking.setDuration(duration);
            booking.setName(name);
            booking.setPhoneNo(phoneNo);
            booking.setEmail(email);
            booking.setCenterId(centerId);
            list.add(booking);
        }
        return list;
    }

  

    public static void insertBooking(Connection conn, Booking booking) throws SQLException {
        String sql = "Insert into booking(date, startTime,duration, name, phoneNo, email, centerId) values (?,?,?,?,?,?,?)";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1, booking.getDate());
        pstm.setString(2, booking.getStartTime());
        pstm.setString(3, booking.getDuration());
        pstm.setString(4, booking.getName());
        pstm.setString(5, booking.getPhoneNo());
        pstm.setString(6, booking.getEmail());
        pstm.setString(7, booking.getCenterId());

        pstm.executeUpdate();
    }
    
    

    public static void deleteBooking(Connection conn, String id) throws SQLException {
        String sql = "Delete from booking where id= ?";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1, id);

        pstm.executeUpdate();
    }
}
