<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>

<%@ page import="com.coforge.training.dao.CourseDAO"%>
<%@ page import="com.coforge.training.dao.DBConnection"%>

<%@ page import="com.coforge.training.model.Course"%>

<%

//==============================
// Login Check
//==============================

if(session.getAttribute("email")==null){

    response.sendRedirect("login.jsp");

    return;

}

//==============================
// Session Data
//==============================

String email=session.getAttribute("email").toString();

String username=session.getAttribute("username").toString();

//==============================
// Load Courses
//==============================

CourseDAO dao=new CourseDAO();

List<Course> courses=dao.getAllCourses();

//==============================
// Dashboard Statistics
//==============================

int userId=0;

int enrolled=0;

int available=0;

int completed=0;

int certificates=0;

try{

    Connection con=DBConnection.getConnection();

    PreparedStatement ps;

    ResultSet rs;

    //--------------------------------
    // Get User ID
    //--------------------------------

    ps=con.prepareStatement(

        "SELECT user_id FROM users WHERE email=?"

    );

    ps.setString(1,email);

    rs=ps.executeQuery();

    if(rs.next()){

        userId=rs.getInt("user_id");

    }

    //--------------------------------
    // Available Courses
    //--------------------------------

    ps=con.prepareStatement(

        "SELECT COUNT(*) FROM courses"

    );

    rs=ps.executeQuery();

    if(rs.next()){

        available=rs.getInt(1);

    }

    //--------------------------------
    // Enrolled Courses
    //--------------------------------

    ps=con.prepareStatement(

        "SELECT COUNT(*) FROM enrollments WHERE user_id=?"

    );

    ps.setInt(1,userId);

    rs=ps.executeQuery();

    if(rs.next()){

        enrolled=rs.getInt(1);

    }

    //--------------------------------
    // Completed Courses
    //--------------------------------

    ps=con.prepareStatement(

        "SELECT COUNT(*) FROM enrollments WHERE user_id=? AND status='Completed'"

    );

    ps.setInt(1,userId);

    rs=ps.executeQuery();

    if(rs.next()){

        completed=rs.getInt(1);

    }

    //--------------------------------
    // Certificates
    //--------------------------------

    certificates=completed;

}
catch(Exception e){

    e.printStackTrace();

}

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Student Dashboard | CourseHub</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/dashboard.css">

</head>

<body>

	<%@ include file="components/navbar.jsp"%>

	<div class="dashboard">

		<!-- =========================
            HEADER
    ========================== -->

		<div class="dashboard-header">

			<h1>

				Welcome,
				<%=username%>
				👋

			</h1>

			<p>Continue learning and build your future with CourseHub LMS.</p>

			<div class="dashboard-actions">

				<a href="mycourses.jsp"> My Courses </a> <a href="#courses">

					Browse Courses </a>

			</div>

		</div>

		<!-- =========================
            STATISTICS
    ========================== -->

		<div class="stats">

			<!-- Enrolled -->

			<div class="stat-card">

				<div class="stat-icon">📚</div>

				<h3>

					<%=enrolled%>

				</h3>

				<p>Courses Enrolled</p>

			</div>

			<!-- Available -->

			<div class="stat-card">

				<div class="stat-icon">🎓</div>

				<h3>

					<%=available%>

				</h3>

				<p>Available Courses</p>

			</div>

			<!-- Completed -->

			<div class="stat-card">

				<div class="stat-icon">✅</div>

				<h3>

					<%=completed%>

				</h3>

				<p>Completed Courses</p>

			</div>

			<!-- Certificates -->

			<div class="stat-card">

				<div class="stat-icon">🏆</div>

				<h3>

					<%=certificates%>

				</h3>

				<p>Certificates Earned</p>

			</div>

		</div>

		<!-- =========================
            COURSES SECTION
    ========================== -->

		<div class="section-title" id="courses">

			<h2>Available Courses</h2>

		</div>


		<div class="course-grid">

			<%
    if(courses != null && !courses.isEmpty()){

        for(Course course : courses){

            boolean isEnrolled = false;

            try{

                Connection con = DBConnection.getConnection();

                PreparedStatement ps = con.prepareStatement(

                    "SELECT * FROM enrollments WHERE user_id=? AND course_id=?"

                );

                ps.setInt(1,userId);

                ps.setInt(2,course.getCourseId());

                ResultSet rs = ps.executeQuery();

                if(rs.next()){

                    isEnrolled = true;

                }

            }catch(Exception e){

                e.printStackTrace();

            }
    %>

			<div class="course-card">

				<!-- Course Banner -->

				<div class="course-image">

					<%=course.getCourseName().substring(0,1).toUpperCase()%>

				</div>

				<!-- Body -->

				<div class="course-body">

					<h3>

						<%=course.getCourseName()%>

					</h3>

					<p>

						<%=course.getDescription()%>

					</p>

					<!-- Course Details -->

					<div class="course-details">

						<div class="course-detail">

							👨‍🏫 <strong><%=course.getInstructor()%></strong>

						</div>

						<div class="course-detail">

							⏳ <strong><%=course.getDuration()%></strong>

						</div>

						<div class="course-detail">

							📂 <strong><%=course.getCategory()%></strong>

						</div>

						<div class="course-detail">

							📘 <strong><%=course.getLevel()%></strong>

						</div>

					</div>

					<!-- Rating -->

					<div class="rating">

						<span class="stars"> ★★★★★ </span> <span> 4.8 (250+
							Students) </span>

					</div>

					<!-- Difficulty Badge -->

					<%

                String level = course.getLevel();

                if(level.equalsIgnoreCase("Beginner")){

                %>

					<span class="level beginner"> Beginner </span>

					<%

                }else if(level.equalsIgnoreCase("Intermediate")){

                %>

					<span class="level intermediate"> Intermediate </span>

					<%

                }else{

                %>

					<span class="level advanced"> Advanced </span>

					<%

                }

                %>

					<!-- Footer -->

					<div class="course-footer">

						<div class="course-price">FREE</div>

						<%

                    if(isEnrolled){

                    %>

						<a href="mycourses.jsp" class="secondary-btn"> View Course </a>

						<%

                    }else{

                    %>

						<a href="EnrollServlet?courseId=<%=course.getCourseId()%>"
							class="primary-btn"> Enroll Now </a>

						<%

                    }

                    %>

					</div>

				</div>

			</div>

			<%

        }

    }else{

    %>

			<div class="empty-card">

				<h2>No Courses Available</h2>

				<p>Courses will appear here once the administrator adds them.</p>

			</div>

			<%

    }

    %>

		</div>


		<!-- ==========================================
            LEARNING SUMMARY
    =========================================== -->

		<div class="summary-card">

			<h3>Learning Summary</h3>

			<div class="summary-list">

				<div class="summary-item">

					<span>Total Courses Available</span> <strong><%=available%></strong>

				</div>

				<div class="summary-item">

					<span>Courses Enrolled</span> <strong><%=enrolled%></strong>

				</div>

				<div class="summary-item">

					<span>Completed Courses</span> <strong><%=completed%></strong>

				</div>

				<div class="summary-item">

					<span>Certificates Earned</span> <strong><%=certificates%></strong>

				</div>

			</div>

		</div>

		<!-- ==========================================
            INFO BANNER
    =========================================== -->

		<div class="info-banner">

			<h3>💡 Keep Learning</h3>

			<p>Complete your enrolled courses to unlock certificates and
				improve your learning profile.</p>

		</div>

		<!-- ==========================================
            QUICK ACTIONS
    =========================================== -->

		<div class="dashboard-actions"
			style="justify-content: center; margin-top: 40px;">

			<a href="mycourses.jsp" class="primary-btn"> My Courses </a> <a
				href="LogoutServlet" class="secondary-btn"> Logout </a>

		</div>

	</div>

	<%@ include file="components/footer.jsp"%>

</body>

</html>