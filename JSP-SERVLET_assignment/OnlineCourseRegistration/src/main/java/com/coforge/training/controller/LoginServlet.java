package com.coforge.training.controller;

import java.io.IOException;

import com.coforge.training.dao.UserDAO;
import com.coforge.training.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        User user = dao.loginUser(email, password);

        if(user != null) {

            HttpSession session = request.getSession();

            session.setAttribute("username", user.getFullname());
            session.setAttribute("email", user.getEmail());

            response.sendRedirect("dashboard.jsp");

        } else {

            response.sendRedirect("error.jsp");

        }

    }

}