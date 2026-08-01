<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<nav class="navbar">

    <div class="logo">

        <a href="${pageContext.request.contextPath}/index.jsp">

            🎓 CourseHub

        </a>

    </div>

    <ul class="nav-menu">

    <%
    if(session.getAttribute("adminName") != null){
    %>

        <li>

            <a href="adminDashboard.jsp">

                Dashboard

            </a>

        </li>

        <li>

            <a href="manageCourses.jsp">

                Courses

            </a>

        </li>

        <li>

            <a href="viewStudents.jsp">

                Students

            </a>

        </li>

        <li>

            <a href="viewEnrollments.jsp">

                Enrollments

            </a>

        </li>

        <li>

            <a href="LogoutServlet">

                Logout

            </a>

        </li>

    <%
    }
    else if(session.getAttribute("username") != null){
    %>

        <li>

            <a href="dashboard.jsp">

                Dashboard

            </a>

        </li>

        <li>

            <a href="mycourses.jsp">

                My Courses

            </a>

        </li>

        <li>

            <a href="LogoutServlet">

                Logout

            </a>

        </li>

    <%
    }
    else{
    %>

        <li>

            <a href="index.jsp">

                Home

            </a>

        </li>

        <li>

            <a href="login.jsp">

                Login

            </a>

        </li>

        <li>

            <a href="register.jsp">

                Register

            </a>

        </li>

        <li>

            <a href="adminLogin.jsp">

                Admin

            </a>

        </li>

    <%
    }
    %>

    </ul>

    <%
    if(session.getAttribute("username") != null){
    %>

        <div class="profile">

            <div class="profile-avatar">

                <%=session.getAttribute("username").toString().substring(0,1).toUpperCase()%>

            </div>

            <span class="profile-name">

                <%=session.getAttribute("username")%>

            </span>

        </div>

    <%
    }
    else if(session.getAttribute("adminName") != null){
    %>

        <div class="profile">

            <div class="profile-avatar">

                A

            </div>

            <span class="profile-name">

                <%=session.getAttribute("adminName")%>

            </span>

        </div>

    <%
    }
    %>

</nav>