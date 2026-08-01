package com.coforge.training.controller;

import java.io.IOException;

import com.coforge.training.dao.AdminDAO;
import com.coforge.training.model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AdminDAO adminDAO = new AdminDAO();

        Admin admin = adminDAO.loginAdmin(email, password);

        if (admin != null) {

            HttpSession session = request.getSession();

            session.setAttribute("adminId", admin.getAdminId());
            session.setAttribute("adminName", admin.getName());
            session.setAttribute("adminEmail", admin.getEmail());

            response.sendRedirect("adminDashboard.jsp");

        } else {

            response.sendRedirect("adminLogin.jsp?error=Invalid Credentials");

        }

    }
}