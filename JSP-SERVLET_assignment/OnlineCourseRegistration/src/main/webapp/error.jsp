<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Error | CourseHub</title>

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

			<div class="status-strip error"></div>

			<div class="message-icon error-icon">❌</div>

			<h1 class="message-title">Oops! Something Went Wrong</h1>

			<p class="message-text">We couldn't process your request. Please
				try again or return to the previous page.</p>

			<div class="message-actions">

				<a href="javascript:history.back()" class="message-btn secondary">

					Go Back </a> <a href="index.jsp" class="message-btn primary"> Home

				</a>

			</div>

		</div>

	</div>

	<%@ include file="components/footer.jsp"%>

</body>

</html>