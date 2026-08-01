package com.coforge.training.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.coforge.training.dao.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EnrollServlet")
public class EnrollServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("email") == null) {

			response.sendRedirect("login.jsp");
			return;
		}

		String email = session.getAttribute("email").toString();

		int courseId = Integer.parseInt(request.getParameter("courseId"));

		try {

			Connection con = DBConnection.getConnection();

			// Get logged in user's ID
			String userSql = "SELECT user_id FROM users WHERE email=?";

			PreparedStatement userPs = con.prepareStatement(userSql);

			userPs.setString(1, email);

			ResultSet rs = userPs.executeQuery();

			if (!rs.next()) {

				response.sendRedirect("error.jsp");
				return;
			}

			int userId = rs.getInt("user_id");

			// Prevent duplicate enrollment
			String checkSql =
					"SELECT * FROM enrollments WHERE user_id=? AND course_id=?";

			PreparedStatement checkPs =
					con.prepareStatement(checkSql);

			checkPs.setInt(1, userId);
			checkPs.setInt(2, courseId);

			ResultSet checkRs = checkPs.executeQuery();

			if (checkRs.next()) {

				response.sendRedirect("mycourses.jsp");
				return;
			}

			// Insert enrollment
			String enrollSql =
					"INSERT INTO enrollments(user_id,course_id,enrollment_date,status) VALUES(?,?,CURDATE(),?)";

			PreparedStatement enrollPs =
					con.prepareStatement(enrollSql);

			enrollPs.setInt(1, userId);
			enrollPs.setInt(2, courseId);
			enrollPs.setString(3, "Enrolled");

			enrollPs.executeUpdate();

			response.sendRedirect("mycourses.jsp");

		} catch (Exception e) {

			e.printStackTrace();
			response.sendRedirect("error.jsp");

		}
	}
}