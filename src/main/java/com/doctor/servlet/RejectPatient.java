package com.doctor.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.rating.ItemBasedCollaborativeFiltering;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/rejectPatient")
public class RejectPatient extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String nextBestDoc = "NA";
		int sp_id = Integer.parseInt(req.getParameter("specialist"));
		int app_id = Integer.parseInt(req.getParameter("appId"));
		String doc_name = req.getParameter("doc_name");
		System.out.println(doc_name);
		
		
		// System.out.println("app_id : " + app_id + " sp_id : " + sp_id);
		
		ItemBasedCollaborativeFiltering cf = new ItemBasedCollaborativeFiltering();
		
		try {
			
			String sql = "select * from rating where sp_id = ?";

			PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
			ps.setInt(1, sp_id);
			// System.out.println(sp_id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				String docName = rs.getString(2);
				String userName = Integer.toString(rs.getInt(3));
				double rating = rs.getInt(4);
				// System.out.println("docName : " + docName + " userName : " + userName + " rating : " + rating);
				cf.addRating(docName, userName, rating);	
			}
			
			nextBestDoc = cf.getNextBestItem(doc_name);
	        // System.out.println("The best item is: " + nextBestDoc);
			
			AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
			boolean f = dao.updateDoctor(nextBestDoc, app_id );
			HttpSession session = req.getSession();
			/* session.setAttribute("doctorObject", ); */
			
			if(f) {
				session.setAttribute("rejectMsg", "The appointment ID : " + app_id + " has been declined");
				resp.sendRedirect("doctor/patients.jsp");
			} else {
				session.setAttribute("errorMsg", "Something went wrong on server");
				resp.sendRedirect("doctor/patients.jsp");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
}
