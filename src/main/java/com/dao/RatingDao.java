package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Rating;

public class RatingDao {

	private Connection conn;

	public RatingDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addRating( Rating r ) {
		boolean f = false;
		
		try {
			
			String sql = "insert into rating ( doc_name, user_id, rating) values ( ?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,r.getDocName());
			ps.setInt(2, r.getUserId());
			ps.setInt(3, r.getRating());
			
			int i = ps.executeUpdate();
			
			if (i == 1) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
}
