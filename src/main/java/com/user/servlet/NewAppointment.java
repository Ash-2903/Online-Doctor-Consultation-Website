package com.user.servlet;

import java.io.IOException;

import com.dao.AppointmentDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/makeNewAppointment")
public class NewAppointment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int aptId = Integer.parseInt(req.getParameter("id"));
		
		AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
		
		try {
			
			boolean f = dao.deleteAppointment(aptId);
			if(f) {
				resp.sendRedirect("user_appointment.jsp");
			} else {
				System.out.println("u did soemthing wrong bruhh");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}

	}

}
