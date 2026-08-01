<%@ page import="com.coforge.training.dao.CourseDAO"%>
<%@ page import="com.coforge.training.model.Course"%>

<%
if(session.getAttribute("adminName")==null){

    response.sendRedirect("adminLogin.jsp");

    return;

}

String id=request.getParameter("id");

if(id==null){

    response.sendRedirect("manageCourses.jsp");

    return;

}

CourseDAO dao=new CourseDAO();

Course course=dao.getCourseById(Integer.parseInt(id));

if(course==null){

    response.sendRedirect("manageCourses.jsp");

    return;

}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Course</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/editCourse.css">

</head>

<body>

	<%@ include file="components/navbar.jsp"%>

	<div class="edit-course">

		<div class="edit-course-card">

			<div class="edit-course-header">

				<h1>Edit Course</h1>

				<span class="course-id"> Course ID : <%=course.getCourseId()%>

				</span>

			</div>

			<form action="UpdateCourseServlet" method="post" class="edit-form">

				<input type="hidden" name="courseId"
					value="<%=course.getCourseId()%>">

				<!-- Course Name -->

				<div>

					<label>Course Name</label> <input type="text" name="courseName"
						value="<%=course.getCourseName()%>" required>

				</div>

				<!-- Instructor -->

				<div>

					<label>Instructor</label> <input type="text" name="instructor"
						value="<%=course.getInstructor()%>" required>

				</div>

				<!-- Duration -->

				<div>

					<label>Duration</label> <input type="text" name="duration"
						value="<%=course.getDuration()%>" required>

				</div>

				<!-- Level -->

				<div>

					<label>Level</label> <select name="level">

						<option <%=course.getLevel().equals("Beginner")?"selected":""%>>
							Beginner</option>

						<option
							<%=course.getLevel().equals("Intermediate")?"selected":""%>>
							Intermediate</option>

						<option <%=course.getLevel().equals("Advanced")?"selected":""%>>
							Advanced</option>

					</select>

				</div>

				<!-- Category -->

				<div>

					<label>Category</label> <input type="text" name="category"
						value="<%=course.getCategory()%>" required>

				</div>

				<!-- Image -->

				<div>

					<label>Image URL</label> <input type="text" name="imageUrl"
						value="<%=course.getImageUrl()%>">

				</div>

				<!-- Description -->

				<div style="grid-column: 1/-1;">

					<label>Description</label>

					<textarea name="description" rows="6" required><%=course.getDescription()%></textarea>

				</div>

				<!-- Buttons -->

				<div class="action-buttons">

					<a href="manageCourses.jsp" class="back-btn"> Back </a>

					<button type="submit" class="update-btn">Update Course</button>

				</div>

			</form>

		</div>

	</div>

	<%@ include file="components/footer.jsp"%>

</body>

</html>