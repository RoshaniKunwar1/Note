<%@page
	import="Com.DAO.postDao, Com.User.post, java.util.List, Com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");

if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login.....");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="allComponent/allCSS.jsp"%>
	<%@ include file="allComponent/navbar.jsp"%>

	<div class="container">
		<h2 class="text-center">All Notes:</h2>

		<%
		String SuccMsg2 = (String) session.getAttribute("SussMsg");
		if (SuccMsg2 != null) {
		%>
		<div class="alert alert-success" role="alert"><%=SuccMsg2%></div>
		<%
		session.removeAttribute("SuccMsg1");
		}
		%>

		<%
		String FailedMsg2 = (String) session.getAttribute("FailedMsg");
		if (FailedMsg2 != null) {
		%>
		<div class="alert alert-success" role="alert"><%=FailedMsg2%></div>
		<%
		session.removeAttribute("FailedMsg1");
		}
		%>

		<div class="row">
			<div class="col-md-12">

				<%
				if (user3 != null) {
					postDao ob = new postDao(DBConnect.getConn());
					List<post> post = ob.getData(user3.getId());
					if (post != null) {
						for (post po : post) {
				%>
				<div class="card mt-3">
					<img alt="" src="image/notePaper.jpg"
						class="card-img-top mb-3 mx-auto" style="max-width: 100px;">


					<%
					String SuccMsg = (String) session.getAttribute("SuccMsg");
					if (SuccMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=SuccMsg%></div>
					<%
					session.removeAttribute("SuccMsg");
					}
					%>

					<%
					String FailedMsg = (String) session.getAttribute("FailedMsg");
					if (FailedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=FailedMsg%></div>
					<%
					session.removeAttribute("FailedMsg");
					}
					%>



					<div class="card-body p-1">

						<h5 class="card-title"><%=po.getTitle()%></h5>
						<p><%=po.getContent()%></p>

						<p>
						<div class="d-flex justify-content-end">
							<b class="text-success">Published By:&nbsp; </b> <b
								class="text-success"><%=user3.getName()%></b>
						</div>


						<div class="d-flex justify-content-end">
							<p>
								<b class="text-success">Published Date: &nbsp;<%=po.getPdate()%></b>
								<b class="text-success"></b>
							</p>
						</div>
						<div class="container text-center mt-2">
							<a href="deleteServlet?note_id=<%=po.getId()%>"
								class="btn btn-danger">Delete</a> <a
								href="edit.jsp?noteId=<%=po.getId()%>" class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>

				<%
				}
				}
				}
				%>


			</div>
		</div>
	</div>
</body>
</html>