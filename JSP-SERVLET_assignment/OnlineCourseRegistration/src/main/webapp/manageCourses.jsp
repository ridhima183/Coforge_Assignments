<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.coforge.training.dao.CourseDAO"%>
<%@ page import="com.coforge.training.model.Course"%>

<%
if(session.getAttribute("adminName")==null){

    response.sendRedirect("adminLogin.jsp");
    return;

}

CourseDAO dao = new CourseDAO();

List<Course> courses = dao.getAllCourses();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Manage Courses | CourseHub</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/manageCourses.css">

</head>

<body>

	<%@ include file="components/navbar.jsp"%>

	<div class="manage-courses">

		<!-- Header -->

		<div class="manage-header">

			<div>

				<h1>Manage Courses</h1>

				<p>View, edit and delete all available courses.</p>

			</div>

			<a href="addCourse.jsp" class="add-course-btn"> + Add Course </a>

		</div>

		<!-- Search -->

		<div class="manage-toolbar">

			<div class="manage-search">

				<input type="text" id="searchCourse" placeholder="Search Course...">

			</div>

		</div>

		<!-- Table -->

		<div class="manage-table">

			<table id="courseTable">

				<thead>

					<tr>

						<th>ID</th>

						<th>Course</th>

						<th>Instructor</th>

						<th>Duration</th>

						<th>Level</th>

						<th>Category</th>

						<th>Actions</th>

					</tr>

				</thead>

				<tbody>

					<%

            if(courses!=null){

                for(Course c : courses){

            %>

					<tr>

						<td><%=c.getCourseId()%></td>

						<td class="course-name"><%=c.getCourseName()%></td>

						<td><%=c.getInstructor()%></td>

						<td><%=c.getDuration()%></td>

						<td>
							<%

                    if(c.getLevel().equalsIgnoreCase("Beginner")){

                    %> <span class="level beginner"> Beginner </span> <%

                    }else if(c.getLevel().equalsIgnoreCase("Intermediate")){

                    %> <span class="level intermediate">

								Intermediate </span> <%

                    }else{

                    %> <span class="level advanced"> Advanced </span> <%

                    }

                    %>

						</td>

						<td><%=c.getCategory()%></td>

						<td>

							<div class="action-buttons">

								<a href="editCourse.jsp?id=<%=c.getCourseId()%>"
									class="edit-btn"> Edit </a> <a
									href="DeleteCourseServlet?id=<%=c.getCourseId()%>"
									class="delete-btn"
									onclick="return confirm('Delete this course?');"> Delete </a>

							</div>

						</td>

					</tr>

					<%

                }

            }

            %>

				</tbody>

			</table>

		</div>

	</div>

	<%@ include file="components/footer.jsp"%>

	<script>

const search=document.getElementById("searchCourse");

search.addEventListener("keyup",function(){

    let filter=this.value.toLowerCase();

    let rows=document.querySelectorAll("#courseTable tbody tr");

    rows.forEach(function(row){

        let text=row.innerText.toLowerCase();

        row.style.display=text.includes(filter)?"":"none";

    });

});

</script>

</body>

</html>