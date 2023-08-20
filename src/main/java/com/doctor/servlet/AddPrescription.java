package com.doctor.servlet;

import java.io.IOException;

import com.db.DBConnect;
import com.entity.Appointment;
import com.entity.Prescription;
import com.dao.AppointmentDao;
import com.dao.PrescrptionDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/sendPrescription")
public class AddPrescription extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		int uid = Integer.parseInt(req.getParameter("uid"));
		String text = req.getParameter("pres_msg");
		
		try {
			
			PrescrptionDao dao = new PrescrptionDao(DBConnect.getConn());
			Prescription p = new Prescription(text,uid,id);
			boolean f1 = dao.addPrescrption(p);
			
			AppointmentDao apDao = new AppointmentDao(DBConnect.getConn());
			Appointment ap = apDao.getAppointmentById(id);
			boolean f2 = apDao.updateAptToOldAptDb(ap);
			
			HttpSession session = req.getSession();
			
			if(f1&&f2) {
				resp.sendRedirect("doctor/patients.jsp");
				session.setAttribute("p_succMsg", "Prescription Submitted");
			} else {
				resp.sendRedirect("doctor/patients.jsp");
				session.setAttribute("p_errorMsg", "Couldn't submit prescription");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
}
