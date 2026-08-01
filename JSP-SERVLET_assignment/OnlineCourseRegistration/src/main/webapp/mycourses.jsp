<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.coforge.training.dao.DBConnection"%>

<%
if (session.getAttribute("email") == null) {

	response.sendRedirect("login.jsp");
	return;

}

String email = session.getAttribute("email").toString();

String username = session.getAttribute("username").toString();

Connection con = DBConnection.getConnection();

PreparedStatement ps;

ResultSet rs;

int userId = 0;

// Get User ID

ps = con.prepareStatement(

		"SELECT user_id FROM users WHERE email=?"

);

ps.setString(1, email);

rs = ps.executeQuery();

if (rs.next()) {

	userId = rs.getInt("user_id");

}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Courses</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mycourses.css">

</head>

<body>

	<%@ include file="components/navbar.jsp"%>

	<div class="mycourses">

		<!-- Header -->

		<div class="mycourses-header">

			<h1>

				Welcome,
				<%=username%>

			</h1>

			<p>Continue your enrolled courses.</p>

		</div>

		<%
		ps = con.prepareStatement(

				"SELECT c.*,e.status FROM courses c JOIN enrollments e ON c.course_id=e.course_id WHERE e.user_id=?"

		);

		ps.setInt(1, userId);

		rs = ps.executeQuery();

		boolean found = false;
		%>

		<div class="mycourse-grid">

			<%
			while (rs.next()) {

				found = true;
			%>

			<div class="mycourse-card">

				<div class="mycourse-image">

					<%=rs.getString("course_name").substring(0, 1).toUpperCase()%>

				</div>

				<div class="mycourse-body">

					<h3>

						<%=rs.getString("course_name")%>

					</h3>

					<p>

						<%=rs.getString("description")%>

					</p>

					<div class="course-info">

						<div class="info-item">

							👨‍🏫
							<%=rs.getString("instructor")%>

						</div>

						<div class="info-item">

							⏳
							<%=rs.getString("duration")%>

						</div>

						<div class="info-item">

							📘
							<%=rs.getString("level")%>

						</div>

						<div class="info-item">

							📂
							<%=rs.getString("category")%>

						</div>

					</div>

					<%
					String status = rs.getString("status");
					%>

					<%
					if (status.equalsIgnoreCase("Completed")) {
					%>

					<span class="status status-completed"> Completed </span>

					<%
					} else if (status.equalsIgnoreCase("In Progress")) {
					%>

					<span class="status status-progress"> In Progress </span>

					<%
					} else {
					%>

					<span class="status status-enrolled"> Enrolled </span>

					<%
					}
					%>

					<div class="progress">

						<div class="progress-top">

							<span>Progress</span>

							<%
							int progress = 0;

							if (status.equals("Completed"))

								progress = 100;

							else if (status.equals("In Progress"))

								progress = 60;

							else

								progress = 10;
							%>

							<span> <%=progress%>%

							</span>

						</div>

						<div class="progress-bar">

							<div class="progress-fill" style="width:<%=progress%>%"></div>

						</div>

					</div>

					<div class="mycourse-footer">

						<%
						if (status.equalsIgnoreCase("Completed")) {
						%>

						<a href="#" class="certificate-btn"> Certificate </a>

						<%
						} else {
						%>

						<a href="#" class="continue-btn"> Continue </a>

						<%
						}
						%>

						<a href="DeleteCourseServlet?courseId=<%=rs.getInt("course_id")%>"
							class="remove-btn"
							onclick="return confirm('Remove this course?');"> Remove </a>

					</div>

				</div>

			</div>

			<%
			}

			if (!found) {
			%>

			<div class="empty-course">

				<h2>No Enrolled Courses</h2>

				<p>You haven't enrolled in any course yet.</p>

				<a href="dashboard.jsp" class="primary-btn"> Browse Courses </a>

			</div>

			<%
			}
			%>

		</div>

	</div>

	<%@ include file="components/footer.jsp"%>

</body>

</html>