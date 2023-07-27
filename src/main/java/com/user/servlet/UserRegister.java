package com.user.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String fullName = req.getParameter("fullName");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			/* System.out.println(fullName + " " + email + " " + password); */

			User u = new User(fullName, email, password); // User constructor from com.user.servlet

			UserDao dao = new UserDao(DBConnect.getConn()); // establishing connection to SQL

			HttpSession session = req.getSession();

			boolean f = dao.register(u); // adding data elements to user_details table of the database

			
			  if (f) { 
				  session.setAttribute("successMsg", "Registered successfully"); 
				  resp.sendRedirect("signup.jsp");
			  } else { 
				  session.setAttribute("errorMsg", "Oops !! Something went wrong"); 
				  resp.sendRedirect("signup.jsp");
			  }
			  
			 

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
