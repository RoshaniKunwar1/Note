<!-- yesko code UserServlet ma xa -->
<!-- enctype="multipart/form-data"  -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register page</title>
</head>
<body>
	<%@ include file="allComponent/allCSS.jsp"%>
	<%@ include file="allComponent/navbar.jsp"%>
	<div class="container pt-5 pb-5">
		<div class="row">
			<div class="col-md-6 offset-md-3 py-2">
				<div class="card shadow">
					<div class="card-header bg-custom text-light text-center">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h1 class="pb-2">Register</h1>
					</div>

					<%
					String sucMsg = (String) session.getAttribute("sucessMsg");
					if (sucMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=sucMsg%>
					Login <a href="login.jsp">Click here</a>
					</div>
					<%
					session.removeAttribute("sucessMsg");
					}
					%>
					
					<%
					String failedMsg = (String)session.getAttribute("failedMsg");
					if(failedMsg != null){
					%>
					<div class="alert alert-danger" role="alert"><%=failedMsg %></div>
					<%
					session.removeAttribute("failedMsg");
					}%>

					<div class="card-body">
						<form method="post" action="registerServlet">
							<div class="mb-3 py-2">
								<label class="form-label">Full Name </label> <input type="text"
									class="form-control" name="uname">
							</div>
							<div class="mb-3 py-2">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email">
							</div>
							<div class="mb-3 py-2">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="password">
							</div>
							<div class="d-grid gap-2 p-3">
								<button class="btn btn-outline-primary p-2" type="submit">Submit</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allComponent/footer.jsp"%>
</body>
</html>