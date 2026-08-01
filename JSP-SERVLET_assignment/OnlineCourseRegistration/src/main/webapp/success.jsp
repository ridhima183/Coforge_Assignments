<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String message = (String) request.getAttribute("successMessage");

if(message == null){

    message = "Your request has been completed successfully.";

}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Success | CourseHub</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/message.css">

</head>

<body>

	<%@ include file="components/navbar.jsp"%>

	<div class="message-page">

		<div class="message-card">

			<!-- Success Strip -->

			<div class="status-strip success"></div>

			<!-- Icon -->

			<div class="message-icon success-icon">✅</div>

			<!-- Heading -->

			<h1 class="message-title">Success!</h1>

			<!-- Message -->

			<p class="message-text">

				<%=message%>

			</p>

			<!-- Buttons -->

			<div class="message-actions">

				<a href="dashboard.jsp" class="message-btn primary"> Go to
					Dashboard </a> <a href="index.jsp" class="message-btn secondary">

					Home </a>

			</div>

		</div>

	</div>

	<%@ include file="components/footer.jsp"%>

</body>

</html>