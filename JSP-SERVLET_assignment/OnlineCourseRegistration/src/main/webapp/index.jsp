<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>CourseHub LMS</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">

</head>

<body>

<%@ include file="components/navbar.jsp" %>

<main>

    <!-- Hero -->

    <section class="hero">

        <div class="hero-left">

            <h1>Learn Today.<br>Lead Tomorrow.</h1>

            <p>
                Join CourseHub and learn from industry-ready courses.
                Register, enroll, track your progress and earn certificates.
            </p>

            <div class="hero-buttons">

                <a href="register.jsp" class="primary-btn">
                    Get Started
                </a>

                <a href="login.jsp" class="secondary-btn">
                    Login
                </a>

            </div>

        </div>

        <div class="hero-right">

            <div class="feature-card">
                <h3>📚</h3>
                <p>20+ Courses</p>
            </div>

            <div class="feature-card">
                <h3>👨‍🎓</h3>
                <p>Expert Mentors</p>
            </div>

            <div class="feature-card">
                <h3>🏆</h3>
                <p>Certificates</p>
            </div>

            <div class="feature-card">
                <h3>💻</h3>
                <p>Hands-on Learning</p>
            </div>

        </div>

    </section>

    <!-- Features -->

    <section class="features">

        <h2 class="section-title">
            Why Choose CourseHub?
        </h2>

        <div class="course-grid">

            <div class="course-card">

                <div class="course-body">

                    <h3>Easy Learning</h3>

                    <p>
                        Beginner-friendly professional courses.
                    </p>

                </div>

            </div>

            <div class="course-card">

                <div class="course-body">

                    <h3>Online Enrollment</h3>

                    <p>
                        Enroll in just one click.
                    </p>

                </div>

            </div>

            <div class="course-card">

                <div class="course-body">

                    <h3>Progress Tracking</h3>

                    <p>
                        Monitor your learning journey.
                    </p>

                </div>

            </div>

            <div class="course-card">

                <div class="course-body">

                    <h3>Certificates</h3>

                    <p>
                        Earn certificates after completion.
                    </p>

                </div>

            </div>

        </div>

    </section>

    <!-- Stats -->

    <section class="stats">

        <div class="stat-card">
            <h3>1000+</h3>
            <p>Students</p>
        </div>

        <div class="stat-card">
            <h3>20+</h3>
            <p>Courses</p>
        </div>

        <div class="stat-card">
            <h3>15+</h3>
            <p>Mentors</p>
        </div>

        <div class="stat-card">
            <h3>95%</h3>
            <p>Success Rate</p>
        </div>

    </section>

    <!-- CTA -->

    <section class="hero">

        <div class="hero-left">

            <h1>Start Your Learning Journey</h1>

            <p>
                Build your future with CourseHub LMS.
            </p>

            <a href="register.jsp" class="primary-btn">

                Join Now

            </a>

        </div>

    </section>

</main>

<%@ include file="components/footer.jsp" %>

</body>

</html>