package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			HttpSession session = req.getSession();
			
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			Doctor d = dao.login(email,password);
			
			if(d != null) {
				session.setAttribute("doctorObject", d);
				resp.sendRedirect("doctor/index.jsp");
			} else {
				session.setAttribute("errorMsg", "Invalid e-mail or passowrd");
				resp.sendRedirect("doctor_login.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
}
