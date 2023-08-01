package com.admin.servlet;
import java.util.*;
import java.io.IOException;

import com.dao.DoctorDao;
import com.dao.SpecialistDao;
import com.db.DBConnect;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			String fullName = req.getParameter("fullName");
			String dob = req.getParameter("dob");
			String qual = req.getParameter("qual");
			String sp = req.getParameter("spec");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String pw = req.getParameter("password");
			
			Doctor doc = new Doctor(fullName,dob,qual,sp,email,phno,pw);
			
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			boolean f = dao.registerDoctor(doc);
			
			HttpSession session = req.getSession();
			
			
			
			if(f) {
				session.setAttribute("succMsg", "Doctor added");
				resp.sendRedirect("admin/doctor.jsp");
			} else {
				session.setAttribute("errMsg", "Oops ! Something went wrong");
				resp.sendRedirect("admin/doctor.jsp");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
}
