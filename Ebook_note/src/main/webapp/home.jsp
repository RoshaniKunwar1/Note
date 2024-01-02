<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user2 = (UserDetails) session.getAttribute("userD");

if (user2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login...");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
<style>
.custom {
	color: #7a4988;
}
</style>
</head>
<body>
	<%@include file="allComponent/allCSS.jsp"%>

	<div class="container-fluid p-0">
		<%@include file="allComponent/navbar.jsp"%>
		<div class="card py-5">
			<div class="card-body text-center">
				<img alt="" src="image/notePaper.jpg"
					class="rounded mx-auto d-block" style="max-width: 350px;">
				<h1 class="custom">START TAKING YOUR NOTES</h1>
				<a href="AddNotes.jsp" class="btn btn-outline-primary">Start
					Here</a>
			</div>
		</div>
	</div>

	<%@include file="allComponent/footer.jsp"%>
</body>
</html>