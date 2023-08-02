package com.user.servlet;

import java.io.IOException;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int userId = Integer.parseInt(req.getParameter("userid"));
		String fullName = req.getParameter("fullname");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String appoint_time = req.getParameter("time");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String disease = req.getParameter("diseases");
		int sp_id = Integer.parseInt(req.getParameter("specialist"));
		String address = req.getParameter("address");
		
		
		
		Appointment ap = new Appointment(userId, fullName, gender , age , appoint_time, email, phno, disease, sp_id, address, "Pending" );
		AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
		
		HttpSession session = req.getSession();
		
		if(dao.addAppointment(ap)) {
			session.setAttribute("succMsg", "Appointment made successfully");
			resp.sendRedirect("user_appointment.jsp");
		} else {
			session.setAttribute("errorMsg", "Oops ! Something went wrong");
			resp.sendRedirect("user_appointment.jsp");
		}
		
	}

	
	
}
