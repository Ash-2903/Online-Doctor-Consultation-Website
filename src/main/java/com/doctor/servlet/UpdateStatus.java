package com.doctor.servlet;

import java.io.IOException;

import com.dao.AppointmentDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			String doc_name = req.getParameter("did");
			String comment = req.getParameter("comm");
			
			AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			
			if (dao.updateCommentStatus(id, doc_name, comment)) {
				session.setAttribute("succMsg", "Status Updated");
				resp.sendRedirect("doctor/patients.jsp");
			} else {
				session.setAttribute("errorMsg", "Oops ! Something went wrong");
				resp.sendRedirect("doctor/patients.jsp");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
}
