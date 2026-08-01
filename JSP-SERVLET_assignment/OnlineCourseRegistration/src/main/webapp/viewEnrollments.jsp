<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.coforge.training.dao.DBConnection"%>

<%
if(session.getAttribute("adminName")==null){

    response.sendRedirect("adminLogin.jsp");
    return;

}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>View Enrollments | CourseHub</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/viewEnrollments.css">

</head>

<body>

	<%@ include file="components/navbar.jsp"%>

	<div class="view-enrollments">

		<!-- Header -->

		<div class="enrollment-header">

			<div>

				<h1>Student Enrollments</h1>

				<p>Manage all course enrollments.</p>

			</div>

		</div>

		<!-- Table -->

		<div class="enrollment-table">

			<table>

				<thead>

					<tr>

						<th>Enrollment ID</th>

						<th>Student</th>

						<th>Email</th>

						<th>Course</th>

						<th>Instructor</th>

						<th>Status</th>

						<th>Actions</th>

					</tr>

				</thead>

				<tbody>

					<%

try{

Connection con=DBConnection.getConnection();

String sql=

"SELECT e.enrollment_id,"

+"u.fullname,"

+"u.email,"

+"c.course_name,"

+"c.instructor,"

+"e.status "

+"FROM enrollments e "

+"JOIN users u ON e.user_id=u.user_id "

+"JOIN courses c ON e.course_id=c.course_id "

+"ORDER BY e.enrollment_id DESC";

PreparedStatement ps=con.prepareStatement(sql);

ResultSet rs=ps.executeQuery();

while(rs.next()){

String status=rs.getString("status");

%>

					<tr>

						<td><%=rs.getInt("enrollment_id")%></td>

						<td><%=rs.getString("fullname")%></td>

						<td><%=rs.getString("email")%></td>

						<td><%=rs.getString("course_name")%></td>

						<td><%=rs.getString("instructor")%></td>

						<td>
							<%

if(status.equalsIgnoreCase("Completed")){

%> <span class="completed"> Completed </span> <%

}else if(status.equalsIgnoreCase("In Progress")){

%> <span class="progress"> In Progress </span> <%

}else{

%> <span class="enrolled"> Enrolled </span> <%

}

%>

						</td>

						<td><a
							href="UpdateEnrollmentStatusServlet?id=<%=rs.getInt("enrollment_id")%>"
							class="edit-btn"> Update </a> <a
							href="DeleteEnrollmentServlet?id=<%=rs.getInt("enrollment_id")%>"
							class="delete-btn"
							onclick="return confirm('Delete this enrollment?');"> Delete

						</a></td>

					</tr>

					<%

}

}catch(Exception e){

e.printStackTrace();

}

%>

				</tbody>

			</table>

		</div>

	</div>

	<%@ include file="components/footer.jsp"%>

</body>

</html>