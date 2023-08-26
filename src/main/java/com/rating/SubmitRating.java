package com.rating;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.RatingDao;
import com.db.DBConnect;
import com.entity.Rating;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/sumbitResponse")
public class SubmitRating extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId = Integer.parseInt(req.getParameter("userId")); 
		String docName = req.getParameter("docId");
		
		
		if(req.getParameter("rating") == null) {
			resp.sendRedirect("viewPrescription.jsp");
		} else {

		 int rating = Integer.parseInt(req.getParameter("rating"));
		 RatingDao rd = new RatingDao(DBConnect.getConn());
		 String sp_id = rd.getSpecilaistId(docName);
	     Rating rt = new Rating(rating, userId, docName, sp_id);
	     boolean f = rd.addRatingToDb(rt);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Thank you for your response");
			resp.sendRedirect("viewPrescription.jsp");
		} else {
			resp.sendRedirect("viewPrescription.jsp");
		}
		
		}
	}

	
}
