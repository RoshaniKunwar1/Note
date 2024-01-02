package Com.Servlet;

import java.io.IOException;

import Com.DAO.postDao;
import Com.DB.DBConnect;
import Com.User.post;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
		
		int uid = Integer.parseInt(req.getParameter("uid"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		postDao dao = new postDao(DBConnect.getConn());
		boolean f = dao.AddNotes(title, content, uid);
		
		if(f) {
			System.out.println("Data Inserted");
			resp.sendRedirect("ShowNotes.jsp");
		}
	}
}
