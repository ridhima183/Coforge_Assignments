package com.coforge.training.controller;

import java.io.IOException;

import com.coforge.training.dao.CourseDAO;
import com.coforge.training.model.Course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateCourseServlet")
public class UpdateCourseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session==null || session.getAttribute("adminEmail")==null){

            response.sendRedirect("adminLogin.jsp");
            return;

        }

        Course course = new Course();

        course.setCourseId(
                Integer.parseInt(request.getParameter("courseId")));

        course.setCourseName(request.getParameter("courseName"));
        course.setDescription(request.getParameter("description"));
        course.setInstructor(request.getParameter("instructor"));
        course.setDuration(request.getParameter("duration"));
        course.setLevel(request.getParameter("level"));
        course.setCategory(request.getParameter("category"));
        course.setImageUrl(request.getParameter("imageUrl"));

        CourseDAO dao = new CourseDAO();

        dao.updateCourse(course);

        response.sendRedirect("manageCourses.jsp");

    }

}