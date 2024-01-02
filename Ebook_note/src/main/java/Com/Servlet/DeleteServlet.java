package Com.Servlet;

import java.io.IOException;

import Com.DAO.postDao;
import Com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteServlet")
public class DeleteServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException{
		int id = Integer.parseInt(req.getParameter("note_id"));
		
		postDao po = new postDao(DBConnect.getConn());
		boolean f = po.deletePost(id);
		
		if(f) {
			HttpSession session = req.getSession();
			session.setAttribute("SuccMsg1", "Deleted Succesfully");
			resp.sendRedirect("ShowNotes.jsp");
		}else {
			HttpSession session = req.getSession();
			session.setAttribute("FailedMsg1", "Couldnot delete Successfully");
			resp.sendRedirect("ShowNotes.jsp");
		}
		
	}
}