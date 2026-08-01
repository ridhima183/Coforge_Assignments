<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<title>Add Course | CourseHub Admin</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/addCourse.css">

</head>

<body>

	<%@ include file="components/navbar.jsp"%>

	<div class="add-course">

		<div class="add-course-card">

			<div class="add-course-header">

				<h1>📚 Add New Course</h1>

				<p>Create a new course that students can enroll in.</p>

			</div>

			<form action="AddCourseServlet" method="post" class="course-form">

				<!-- Course Name -->

				<div>

					<label>Course Name</label> <input type="text" name="courseName"
						placeholder="Java Programming" required>

				</div>

				<!-- Instructor -->

				<div>

					<label>Instructor</label> <input type="text" name="instructor"
						placeholder="John Smith" required>

				</div>

				<!-- Duration -->

				<div>

					<label>Duration</label> <input type="text" name="duration"
						placeholder="8 Weeks" required>

				</div>

				<!-- Level -->

				<div>

					<label>Level</label> <select name="level" required>

						<option value="">Select Level</option>

						<option>Beginner</option>

						<option>Intermediate</option>

						<option>Advanced</option>

					</select>

				</div>

				<!-- Category -->

				<div>

					<label>Category</label> <input type="text" name="category"
						placeholder="Programming" required>

				</div>

				<!-- Image URL -->

				<div>

					<label>Image URL</label> <input type="text" name="imageUrl"
						placeholder="images/java.jpg">

				</div>

				<!-- Description -->

				<div class="full-width">

					<label>Description</label>

					<textarea name="description"
						placeholder="Write a detailed course description..." required></textarea>

				</div>

				<!-- Buttons -->

				<div class="form-buttons">

					<a href="manageCourses.jsp" class="cancel-btn"> Cancel </a>

					<button type="submit" class="save-btn">Add Course</button>

				</div>

			</form>

		</div>

	</div>

	<%@ include file="components/footer.jsp"%>

</body>

</html>