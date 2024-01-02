<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Com.Servlet.LoginServlet"%>
<%
UserDetails user1 = (UserDetails)session.getAttribute("userD");

if(user1 == null){
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login...");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn-custom {
	background-color: #7a4988;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="allComponent/allCSS.jsp"%>
		<%@ include file="allComponent/navbar.jsp"%>

		<h1 class="text-center">Add Your Notes</h1>

		<div class="container">
			<div class="row">
				<div class="col=md-12">
					<form action="AddNotesServlet" method="post">
						<div class="mb-3">

							<%
							UserDetails us = (UserDetails) session.getAttribute("userD");
							if (us != null) {
							%>
							<div class="col-md-3 pb-4">
							<input type="text" class="form-control" value="<%=us.getName()%>">
							<input type ="hidden" value="<%=us.getId() %>" name="uid">
							</div>
							<% } %>

							<label for="exampleInputEmail1" class="form-label">Enter Title</label> 
							<input type="text" class="form-control" name="title" required>
						</div>

						<div class="form-group ">
							<label for="exampleInputEmail1" class="form-label">Enter
								Content</label>
							<textarea rows="8" cols="" class="form-control" name="content" >
							</textarea></div>

						<div class="container text-center mt-3 mb-5">
							<button type="submit" class="btn btn-outline-primary fs-5">Add
								Notes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%@ include file="allComponent/footer.jsp"%>
	</div>
</body>
</html>