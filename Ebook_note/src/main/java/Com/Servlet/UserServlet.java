package Com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import Com.DAO.UserDao;
import Com.DB.DBConnect;
import Com.User.UserDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/registerServlet")
public class UserServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
		String name = req.getParameter("uname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserDetails us = new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		UserDao dao = new UserDao(DBConnect.getConn());
		boolean f = dao.addUser(us);
		System.out.println(f+" hello");
		PrintWriter out = resp.getWriter();
		
		if(f) {
			HttpSession session = req.getSession();
			session.setAttribute("sucessMsg", "Registeration Sucessfully");
			resp.sendRedirect("register.jsp");
		}
		else {
			HttpSession session = req.getSession();
			session.setAttribute("failedMsg", "Something went wrong");
			resp.sendRedirect("register.jsp");
		}
		
}
	
}