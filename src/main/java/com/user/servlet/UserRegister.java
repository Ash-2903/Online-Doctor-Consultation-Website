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

@WebServlet("/user_register")
public class UserRegister extends HttpServlet  {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String fullName = req.getParameter("fullName");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			User u = new User(fullName, email, password);
			
			UserDao dao = new UserDao(DBConnect.getConn());
			
			boolean f = dao.register(u);
			
			if (f) {
				System.out.println("registered successfully");
			} else {
				System.out.println("oops ! something wrong on server");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
}
