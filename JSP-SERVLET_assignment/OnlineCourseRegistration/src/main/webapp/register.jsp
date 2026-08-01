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

<title>Register | CourseHub LMS</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/register.css">

</head>

<body>

	<%@ include file="components/navbar.jsp"%>

	<div class="register-page">

		<div class="register-card">

			<!-- LEFT PANEL -->

			<div class="register-left">

				<h1>Join CourseHub</h1>

				<p>Create your account and begin your learning journey with
					industry-ready courses, certificates, and progress tracking.</p>

				<div class="register-features">

					<div class="register-feature">

						<i>📚</i> <span>20+ Professional Courses</span>

					</div>

					<div class="register-feature">

						<i>🏆</i> <span>Earn Certificates</span>

					</div>

					<div class="register-feature">

						<i>📈</i> <span>Track Learning Progress</span>

					</div>

				</div>

			</div>

			<!-- RIGHT PANEL -->

			<div class="register-right">

				<form action="RegisterServlet" method="post" class="register-form"
					onsubmit="return validatePassword();">

					<h2>Student Registration</h2>

					<p>Create your CourseHub account.</p>

					<!-- Row 1 -->

					<div class="form-row">

						<div class="form-group">

							<label> Full Name </label> <input type="text" name="fullname"
								required>

						</div>

						<div class="form-group">

							<label> Email </label> <input type="email" name="email" required>

						</div>

					</div>

					<!-- Row 2 -->

					<div class="form-row">

						<div class="form-group">

							<label> Mobile Number </label> <input type="text" name="mobile"
								maxlength="10" required>

						</div>

						<div class="form-group">

							<label> Student ID </label> <input type="text" name="studentId"
								required>

						</div>

					</div>

					<!-- Row 3 -->

					<div class="form-row">

						<div class="form-group">

							<label> Password </label> <input type="password" id="password"
								name="password" required>

						</div>

						<div class="form-group">

							<label> Confirm Password </label> <input type="password"
								id="confirmPassword" required>

						</div>

					</div>

					<div class="terms">

						<input type="checkbox" required> <span> I agree to
							the Terms & Conditions and Privacy Policy. </span>

					</div>

					<button type="submit" class="register-btn">Create Account

					</button>

					<div class="login-link">

						Already have an account? <a href="login.jsp"> Login Here </a>

					</div>

				</form>

			</div>

		</div>

	</div>

	<%@ include file="components/footer.jsp"%>

	<script>

function validatePassword(){

    let pass=document.getElementById("password").value;

    let confirm=document.getElementById("confirmPassword").value;

    if(pass!==confirm){

        alert("Passwords do not match.");

        return false;

    }

    return true;

}

</script>

</body>

</html>