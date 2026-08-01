<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
if(session.getAttribute("username")!=null){
    response.sendRedirect("dashboard.jsp");
    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Login | CourseHub LMS</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">

</head>

<body>

	<%@ include file="components/navbar.jsp"%>

	<div class="login-page">

		<div class="login-card">

			<!-- =======================
                LEFT PANEL
        ======================== -->

			<div class="login-left">

				<h1>Welcome Back!</h1>

				<p>Continue your learning journey with CourseHub. Access your
					enrolled courses, track progress, and earn certificates.</p>

				<div class="login-features">

					<div class="login-feature">

						<i>📚</i> <span>20+ Professional Courses</span>

					</div>

					<div class="login-feature">

						<i>🏆</i> <span>Earn Certificates</span>

					</div>

					<div class="login-feature">

						<i>📈</i> <span>Track Your Progress</span>

					</div>

				</div>

			</div>

			<!-- =======================
                RIGHT PANEL
        ======================== -->

			<div class="login-right">

				<form action="LoginServlet" method="post" class="login-form">

					<h2>Student Login</h2>

					<p>Login to continue learning.</p>

					<!-- Email -->

					<div class="login-group">

						<label>Email Address</label> <input type="email" name="email"
							placeholder="Enter your email" required>

					</div>

					<!-- Password -->

					<div class="login-group">

						<label>Password</label> <input type="password" name="password"
							placeholder="Enter your password" required>

					</div>

					<!-- Remember -->

					<div class="login-options">

						<label> <input type="checkbox"> Remember Me

						</label> <a href="#"> Forgot Password? </a>

					</div>

					<!-- Button -->

					<button type="submit" class="login-btn">Login</button>

					<!-- Divider -->

					<div class="divider">OR</div>

					<!-- Register -->

					<div class="register-link">

						Don't have an account? <a href="register.jsp"> Register Here </a>

					</div>

				</form>

			</div>

		</div>

	</div>

	<%@ include file="components/footer.jsp"%>

</body>

</html>