package com.rating;

import java.io.IOException;

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
		/* int docId = Integer.parseInt(req.getParameter("docId")); */
		int rating = Integer.parseInt(req.getParameter("rating"));

		
		
		System.out.println("userid : " + userId + " doctorId : " + docName + " rating : " + rating);
		
		RatingDao rd = new RatingDao(DBConnect.getConn());
		Rating rt = new Rating(rating, userId, docName);
		boolean f = rd.addRating(rt);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Thank you for your response");
			resp.sendRedirect("view_docs.jsp");
		} else {
			resp.sendRedirect("view_docs.jsp");
		}
		
	
	}

	
}
