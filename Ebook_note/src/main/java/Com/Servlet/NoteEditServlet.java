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

@WebServlet("/NoteEditServlet1")
public class NoteEditServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException{
		int note_id =Integer.parseInt(req.getParameter("note_id"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		try {
		postDao pd = new postDao(DBConnect.getConn());
		boolean f = pd.postUpdate(note_id, title, content);
		
		if(f) {
			HttpSession session = req.getSession();
			session.setAttribute("SuccMsg","Notes Edited SuccessFully");
			
			resp.sendRedirect("ShowNotes.jsp");
		}
		else {
			HttpSession session = req.getSession();
			session.setAttribute("FailedMsg", "Couldnot Update Notes, Sorry");
			resp.sendRedirect("ShowNotes.jsp");
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
}
}