<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Com.User.UserDetails, Com.DAO.UserDao, Com.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>
<%@include file="allCSS.jsp"%>
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}

.bg-custom {
	background-color: #7a4988;
}

.navbar .nav-item .nav-link {
	font-size: 20px;
	color: white;
}

.navbar-custom .nav-item:hover .nav-link {
	background-color: white;
	color: #7a4988;
	border-radius: 10px;
}
</style>
</head>
<body>
	<div class="container-fluid"
		style="height: 10px; background-color: #7a4988"></div>
	<div class="container-fluid p-3 bg-light"></div>
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><i
				class="fa-solid fa-graduation-cap"></i>E Notes</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp"><i
							class="fa-solid fa-house"></i>Home</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="AddNotes.jsp"><i
							class="fa-solid fa-circle-plus"></i>Add Note</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ShowNotes.jsp"><i
							class="fa-regular fa-address-book"></i> Show Note</a></li>

				</ul>

				<%
				UserDetails user = (UserDetails) session.getAttribute("userD");
				if (user != null) {
				%>
				<a href="" button class="btn btn-light mx-2" data-bs-toggle="modal"
					data-bs-target="#exampleModal" type="submit"> <i
					class="fa-solid fa-circle-user"></i> <%=user.getName()%></a> <a
					href="logoutServlet" class="btn btn-light mx-2"> <i
					class="fa-solid fa-right-to-bracket"></i> logout
				</a>




				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">Profile: </h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="container text-center">
									<i class="fa fa-user fa-3x"></i>
									<hr>
									<table class="table">
										<tbody>
											<tr>
												<th>User Id:</th>
												<td><%=user.getId()%></td>
											</tr>
											<tr>
												<th>Full Name:</th>
												<td><%=user.getName()%></td>
											</tr>
											<tr>
												<th>Email Id:</th>
												<td><%=user.getEmail()%></td>
											</tr>
										</tbody>
									</table>
								</div>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>

						</div>
					</div>
				</div>




				<%
				} else {
				%>
				<a href="login.jsp" class="btn btn-light mx-2"> <i
					class="fa-solid fa-right-to-bracket"></i></i> Login
				</a> <a href="register.jsp" button class="btn btn-outline-light mx-2"
					type="submit"> <i class="fa-solid fa-user-plus"></i> Register
				</a>

				<%
				}
				%>
				</button>
				</form>
			</div>
		</div>
	</nav>
</body>
</html>