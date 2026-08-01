<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
if(session.getAttribute("adminName") != null){
    response.sendRedirect("adminDashboard.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin Login | CourseHub LMS</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/adminlogin.css">

</head>

<body>

<%@ include file="components/navbar.jsp" %>

<div class="admin-login-page">

    <div class="admin-login-card">

        <!-- Header -->

        <div class="admin-header">

            <div class="admin-icon">

                🛡

            </div>

            <h2>

                Administrator Login

            </h2>

            <p>

                Secure access to the CourseHub Administration Panel

            </p>

        </div>

        <!-- Login Form -->

        <form action="AdminLoginServlet" method="post">

            <div class="admin-group">

                <label>Email Address</label>

                <input
                    type="email"
                    name="email"
                    placeholder="Enter admin email"
                    required>

            </div>

            <div class="admin-group">

                <label>Password</label>

                <input
                    type="password"
                    name="password"
                    placeholder="Enter password"
                    required>

            </div>

            <button
                type="submit"
                class="admin-btn">

                Login

            </button>

        </form>

        <!-- Information -->

        <div class="admin-info">

            <h4>Administrator Access</h4>

            <p>

                Only authorized administrators can manage
                courses, students and enrollments.

            </p>

        </div>

        <a href="index.jsp" class="back-home">

            ← Back to Home

        </a>

    </div>

</div>

<%@ include file="components/footer.jsp" %>

</body>

</html>