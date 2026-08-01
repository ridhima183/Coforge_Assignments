package com.coforge.training.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.coforge.training.dao.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteCourseServlet")
public class DeleteCourseServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("email") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        try {

            int enrollmentId =
                    Integer.parseInt(request.getParameter("courseId"));

            Connection con = DBConnection.getConnection();

            String sql =
                    "DELETE FROM enrollments WHERE enrollment_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, enrollmentId);

            int rows = ps.executeUpdate();

            if (rows > 0) {

                response.sendRedirect("mycourses.jsp");

            } else {

                response.sendRedirect("error.jsp");

            }

        } catch (Exception e) {

            e.printStackTrace();
            response.sendRedirect("error.jsp");

        }

    }

}