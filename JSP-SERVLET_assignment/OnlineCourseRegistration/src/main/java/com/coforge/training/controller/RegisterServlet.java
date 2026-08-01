package com.coforge.training.controller;

import java.io.IOException;

import com.coforge.training.dao.UserDAO;
import com.coforge.training.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String studentId = request.getParameter("studentId");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            response.sendRedirect("error.jsp");
            return;
        }

        User user = new User();

        user.setFullname(fullname);
        user.setEmail(email);
        user.setPhone(phone);
        user.setStudentId(studentId);
        user.setPassword(password);

        UserDAO dao = new UserDAO();

        boolean status = dao.registerUser(user);

        if (status) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}