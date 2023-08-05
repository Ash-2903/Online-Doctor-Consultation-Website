package com.user.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dao.AppointmentDao;
import com.dao.RatingDao;
import com.db.DBConnect;
import com.entity.Appointment;
import com.rating.ItemBasedCollaborativeFiltering;

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
		
		ItemBasedCollaborativeFiltering cf = new ItemBasedCollaborativeFiltering();
		
		try {
			
			String sql = "select * from rating where sp_id = ?";

			PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
			
			ps.setInt(1, sp_id);
			System.out.println(sp_id);
			
			ResultSet rs = ps.executeQuery();
			System.out.println(rs.toString());
			
			while(rs.next()) {
				String docName = rs.getString(2);
				String userName = Integer.toString(rs.getInt(3));
				double rating = rs.getInt(4);
				System.out.println("Name : " + docName + " userId : " + userName + " rating " + rating);
				cf.addRating(docName, userName, rating);	
			}
			
			String bestItem = cf.getBestItem();
	        System.out.println("The best item is: " + bestItem);
	        session.setAttribute("doc_name", bestItem);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		if(dao.addAppointment(ap)) {
			session.setAttribute("succMsg", "Appointment made successfully");
			
			resp.sendRedirect("view_appointment.jsp");
		} else {
			session.setAttribute("errorMsg", "Oops ! Something went wrong");
			resp.sendRedirect("user_appointment.jsp");
		}
		
	}

	
	
}
