package Com.Servlet;

import java.io.IOException;

import Com.DAO.UserDao;
import Com.DB.DBConnect;
import Com.User.UserDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
		String email = req.getParameter("email");
		String password = req.getParameter("password");
				
		UserDetails us = new UserDetails();
		us.setEmail(email);
		us.setPassword(password);
		
		UserDao dao = new UserDao(DBConnect.getConn());
		UserDetails use = dao.loginUser(us);

		if(use!=null) {
			HttpSession session = req.getSession();
			session.setAttribute("userD", use);
			resp.sendRedirect("home.jsp");
		}
		else {
			HttpSession session = req.getSession();
			session.setAttribute("failedMsg","Invalid Email or password");
			resp.sendRedirect("login.jsp");
		}
	}
}