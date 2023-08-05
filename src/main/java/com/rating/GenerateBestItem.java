package com.rating;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dao.RatingDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/generateBestDoc")
public class GenerateBestItem extends HttpServlet {
	
	/* private Connection conn; */

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ItemBasedCollaborativeFiltering cf = new ItemBasedCollaborativeFiltering();
		
		try {
			RatingDao dao = new RatingDao(DBConnect.getConn());
			
			String sql = "select * from rating where sp_id = ?";
			PreparedStatement ps = DBConnect.getConn().prepareStatement(sql);
			ps.setString(1,"nope");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				String docName = rs.getString(2);
				String userId =Integer.toString(rs.getInt(3));
				double rating = rs.getInt(4);
				System.out.println("Name : " + docName + " userId : " + userId + " rating " + rating);
				cf.addRating(docName, userId, rating);	
			}
			
			String bestItem = cf.getBestItem();
	        System.out.println("The best item is: " + bestItem);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
}
