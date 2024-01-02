<%@page import="Com.DAO.postDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Com.Servlet.LoginServlet, Com.User.*"%>

<% 
UserDetails user4 = (UserDetails) session.getAttribute("userD");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Notes</title>
</head>
<body>

	<div class="container-fluid">
		<%@ include file="allComponent/allCSS.jsp"%>
		<%@ include file="allComponent/navbar.jsp"%>

		<h1 class="text-center">Edit Your Notes</h1>

		<div class="container">
			<div class="row">
				<div class="col=md-12">
					<form action="NoteEditServlet1" method="post">
						<div class="mb-3">


							<%
							int note_id = Integer.parseInt(request.getParameter("noteId"));
							out.print(note_id);

							postDao pd = new postDao(DBConnect.getConn());
							out.print(pd);
							if (pd != null) {
								post pd1 = pd.getDataById(note_id);
								out.print(pd1);
							%>

							<input type="hidden" value="<%=note_id%>" name="note_id">

							<div class="col-md-3 pb-4">
								<input type="text" class="form-control"
									value="<%=user4.getName()%>">
							</div>



							<label for="exampleInputEmail1" class="form-label">Enter
								Title</label> <input type="text" class="form-control" name="title"
								value="<%=pd1.getTitle()%>" required>
						</div>

						<div class="form-group ">
							<label for="exampleInputEmail1" class="form-label">Enter
								Content</label>
							<textarea rows="8" cols="" class="form-control " name="content" required>
							 <%=pd1.getContent() %></textarea>
						</div>
						<%
						}
						%>

						<div class="container text-center mt-3 mb-5">
							<button type="submit" class="btn btn-outline-primary fs-5">Edit
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