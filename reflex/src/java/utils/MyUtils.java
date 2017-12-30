/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author yanaramli22
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import beans.Patient;
import beans.Therapist;


public class MyUtils {

    public static final String ATT_NAME_CONNECTION = "ATTRIBUTE_FOR_CONNECTION";

    private static final String ATT_NAME_USER_NAME = "ATTRIBUTE_FOR_STORE_USER_NAME_IN_COOKIE";

    // Store Connection in request attribute.
    // (Information stored only exist during requests)
    public static void storeConnection(ServletRequest request, Connection conn) {
        request.setAttribute(ATT_NAME_CONNECTION, conn);
    }

    // Get the Connection object has been stored in attribute of the request.
    public static Connection getStoredConnection(ServletRequest request) {
         Connection conn = (Connection) request.getAttribute(ATT_NAME_CONNECTION);
        return conn;
    }

    // Store user info in Session.
    public static void storeLoginedUser(HttpSession session, Patient loginedUser) {
        // On the JSP can access via ${loginedUser}
        session.setAttribute("loginedUser", loginedUser);
    }
    
    public static void storeLoginedAdmin(HttpSession session, Therapist loginedAdmin) {
        // On the JSP can access via ${loginedUser}
        session.setAttribute("loginedAdmin", loginedAdmin);
    }

    // Get the user information stored in the session.
    public static Patient getLoginedUser(HttpSession session) {
        Patient loginedUser = (Patient) session.getAttribute("loginedUser");
        return loginedUser;
    }
    
    public static Therapist getLoginedAdmin(HttpSession session) {
        Therapist loginedAdmin = (Therapist) session.getAttribute("loginedAdmin");
        return loginedAdmin;
    }

    // Store info in Cookie
    public static void storeUserCookie(HttpServletResponse response, Patient user) {
        System.out.println("Store user cookie");
        //Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, user.getUserName());
        //1 day (Converted to seconds)
        //cookieUserName.setMaxAge(24 * 60 * 60);
        //response.addCookie(cookieUserName);
    }
    
    public static void storeAdminCookie(HttpServletResponse response, Therapist admin) {
        System.out.println("Store admin cookie");
        //Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, user.getUserName());
        //1 day (Converted to seconds)
        //cookieUserName.setMaxAge(24 * 60 * 60);
        //response.addCookie(cookieUserName);
    }

    public static String getUserNameInCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (ATT_NAME_USER_NAME.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    // Delete cookie.
    public static void deleteUserCookie(HttpServletResponse response) {
        Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, null);
        // 0 seconds (This cookie will expire immediately)
        cookieUserName.setMaxAge(0);
        response.addCookie(cookieUserName);
    }
}
