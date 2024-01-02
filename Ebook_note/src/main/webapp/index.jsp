<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Com.DB.DBConnect" %> 
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<style type="text/css">
.back-img{
background: url("image/notes.jpg");
width: 100%;
height: 80vh;
opacity: 75%;
background-repaeat: no-repeat;
background-size: cover;
}
</style>
</head>
<body>
<%@include file="allComponent/navbar.jsp" %>

 <%-- <% 
Connection conn = DBConnect.getConn(); 
	out.println(conn);
%> --%>

<div class="container-fluid back-img ">
<div class="text-center p-5">
<h1 class="text-light pt-5 mt-5"><i class="fa-solid fa-book"></i> E Notes-Save Your Notes</h1>
<a href="login.jsp" class="btn btn-light px-4 mx-2"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
<a href = "register.jsp" class="btn btn-outline-light px-4"><i class="fa-solid fa-user-plus"></i>Register</a>
</div>
</div>
<%@include file="allComponent/footer.jsp" %>
</body>
</html>
