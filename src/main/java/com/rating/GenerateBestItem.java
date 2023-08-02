package com.rating;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/generateBestDoc")
public class GenerateBestItem extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		/*
		 * int userId = Integer.parseInt(req.getParameter("userId")); int docId =
		 * Integer.parseInt(req.getParameter("docId"));
		 */
		String rating = (req.getParameter("rating"));
		String userId = req.getParameter("userId");
		String docId = req.getParameter("docId");
		
		System.out.println("userid : " + userId + " doctorId " + docId + "rating : " + rating);
		
		resp.sendRedirect("index.jsp");
		
	}

	
	
}
