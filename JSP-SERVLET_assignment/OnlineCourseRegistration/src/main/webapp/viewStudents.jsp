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

<title>View Students | CourseHub</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/viewStudents.css">

</head>

<body>

	<%@ include file="components/navbar.jsp"%>

	<div class="view-students">

		<!-- Header -->

		<div class="students-header">

			<div>

				<h1>Registered Students</h1>

				<p>View all registered students in CourseHub.</p>

			</div>

			<div class="student-search">

				<input type="text" id="searchStudent"
					placeholder="Search student...">

			</div>

		</div>

		<!-- Students Table -->

		<div class="students-table">

			<table id="studentTable">

				<thead>

					<tr>

						<th>ID</th>

						<th>Full Name</th>

						<th>Email</th>

						<th>Mobile</th>

						<th>Student ID</th>

						<th>Status</th>

					</tr>

				</thead>

				<tbody>

					<%

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(

"SELECT * FROM users ORDER BY user_id DESC"

);

ResultSet rs = ps.executeQuery();

while(rs.next()){

%>

					<tr>

						<td><%=rs.getInt("user_id")%></td>

						<td class="student-name"><%=rs.getString("fullname")%></td>

						<td class="student-email"><%=rs.getString("email")%></td>

						<td><%=rs.getString("mobile")%></td>

						<td><%=rs.getString("student_id")%></td>

						<td><span class="student-status"> Active </span></td>

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

	<script>

const search=document.getElementById("searchStudent");

search.addEventListener("keyup",function(){

    let filter=this.value.toLowerCase();

    let rows=document.querySelectorAll("#studentTable tbody tr");

    rows.forEach(function(row){

        let text=row.innerText.toLowerCase();

        row.style.display=text.includes(filter) ? "" : "none";

    });

});

</script>

</body>

</html>