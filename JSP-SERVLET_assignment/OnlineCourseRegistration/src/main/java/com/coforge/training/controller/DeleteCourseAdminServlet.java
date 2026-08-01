package com.coforge.training.controller;

import java.io.IOException;

import com.coforge.training.dao.CourseDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteCourseAdminServlet")
public class DeleteCourseAdminServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("adminEmail") == null) {

            response.sendRedirect("adminLogin.jsp");
            return;

        }

        int courseId = Integer.parseInt(request.getParameter("courseId"));

        CourseDAO dao = new CourseDAO();

        boolean status = dao.deleteCourse(courseId);

        if (status) {

            response.sendRedirect("manageCourses.jsp");

        } else {

            response.sendRedirect("error.jsp");

        }

    }

}