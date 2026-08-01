<%@ page import="java.sql.*"%>
<%@ page import="com.coforge.training.dao.DBConnection"%>

<%
if(session.getAttribute("adminName")==null){
    response.sendRedirect("adminLogin.jsp");
    return;
}

int students=0;
int courses=0;
int enrollments=0;
int completed=0;

try{

    Connection con=DBConnection.getConnection();

    PreparedStatement ps;

    ResultSet rs;

    // Total Students
    ps=con.prepareStatement("SELECT COUNT(*) FROM users");
    rs=ps.executeQuery();

    if(rs.next()){
        students=rs.getInt(1);
    }

    // Total Courses
    ps=con.prepareStatement("SELECT COUNT(*) FROM courses");
    rs=ps.executeQuery();

    if(rs.next()){
        courses=rs.getInt(1);
    }

    // Total Enrollments
    ps=con.prepareStatement("SELECT COUNT(*) FROM enrollments");
    rs=ps.executeQuery();

    if(rs.next()){
        enrollments=rs.getInt(1);
    }

    // Completed Courses
    ps=con.prepareStatement(
        "SELECT COUNT(*) FROM enrollments WHERE status='Completed'");
    rs=ps.executeQuery();

    if(rs.next()){
        completed=rs.getInt(1);
    }

}catch(Exception e){

    e.printStackTrace();

}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin Dashboard | CourseHub</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admindashboard.css">

</head>

<body>

	<%@ include file="components/navbar.jsp"%>

	<div class="admin-dashboard">

		<!-- Header -->

		<div class="admin-header">

			<h1>

				Welcome,
				<%=session.getAttribute("adminName")%>

			</h1>

			<p>Manage students, courses and enrollments from one place.</p>

		</div>

		<!-- Statistics -->

		<div class="admin-stats">

			<div class="admin-stat-card">

				<div class="admin-stat-icon">👨‍🎓</div>

				<h2><%=students%></h2>

				<p>Total Students</p>

			</div>

			<div class="admin-stat-card">

				<div class="admin-stat-icon">📚</div>

				<h2><%=courses%></h2>

				<p>Total Courses</p>

			</div>

			<div class="admin-stat-card">

				<div class="admin-stat-icon">📝</div>

				<h2><%=enrollments%></h2>

				<p>Total Enrollments</p>

			</div>

			<div class="admin-stat-card">

				<div class="admin-stat-icon">🏆</div>

				<h2><%=completed%></h2>

				<p>Completed Courses</p>

			</div>

		</div>

		<!-- Quick Actions -->

		<div class="admin-actions">

			<div class="admin-card">

				<div class="admin-card-icon">➕</div>

				<h3>Add Course</h3>

				<p>Create a brand new course for students.</p>

				<a href="addCourse.jsp"> Open </a>

			</div>

			<div class="admin-card">

				<div class="admin-card-icon">📚</div>

				<h3>Manage Courses</h3>

				<p>Edit or delete existing courses.</p>

				<a href="manageCourses.jsp"> Open </a>

			</div>

			<div class="admin-card">

				<div class="admin-card-icon">👨‍🎓</div>

				<h3>View Students</h3>

				<p>View all registered students.</p>

				<a href="viewStudents.jsp"> Open </a>

			</div>

			<div class="admin-card">

				<div class="admin-card-icon">📝</div>

				<h3>View Enrollments</h3>

				<p>Track all student enrollments.</p>

				<a href="viewEnrollments.jsp"> Open </a>

			</div>

		</div>

		<!-- Recent Activity -->

		<div class="activity">

			<h2>Recent Activity</h2>

			<div class="activity-item">

				<span class="activity-user"> New student registrations appear
					here. </span> <span class="activity-time"> Live </span>

			</div>

			<div class="activity-item">

				<span class="activity-user"> New enrollments will appear
					here. </span> <span class="activity-time"> Live </span>

			</div>

			<div class="activity-item">

				<span class="activity-user"> Recently added courses will
					appear here. </span> <span class="activity-time"> Live </span>

			</div>

		</div>

	</div>

	<%@ include file="components/footer.jsp"%>

</body>

</html>