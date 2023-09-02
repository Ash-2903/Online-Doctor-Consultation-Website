package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Rating;

public class RatingDao {

	private Connection conn;

	public RatingDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public String getSpecilaistId(String docName) {
	    String sp = "default";
	    String sp_id = "0";
	    System.out.println(sp);
	    
	    try {
	    	
	        String st = "SELECT specialist FROM doctor_details WHERE full_name = ?";
	        PreparedStatement ps = conn.prepareStatement(st);
	        ps.setString(1, docName.trim());
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            sp = rs.getString(1);
	            System.out.println("hi: " + sp);
	        }
	        
	        String st2 = "Select id from specialist where sp_name = ?";
	        PreparedStatement ps2 = conn.prepareStatement(st2);
	        ps2.setString(1, sp);
	        ResultSet rs2 = ps2.executeQuery();
	        
	        if (rs2.next()) {
	            sp_id = rs2.getString(1);
	            System.out.println("sp_id : " + sp_id);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return sp_id;
	}
	
	
	public boolean addRatingToDb( Rating r ) {
		boolean f = false;
		
		try {
			
			String sql = "insert into rating ( doc_name, user_id, rating,sp_id) values ( ?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,r.getDocName());
			ps.setInt(2, r.getUserId());
			ps.setInt(3, r.getRating());
			ps.setString(4, r.getSpid());
			
			int i = ps.executeUpdate();
			
			if (i == 1) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean checkRating(int uid, String doc) {
		
		boolean f = false;
		
		try {
			
			String sql = "select * from rating where doc_name = ? and user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, doc);
			ps.setInt(2, uid);
			ResultSet rs = ps.executeQuery();
		
			if (rs.next()) {
				f = true;
			}
			
		} catch (Exception e ) {
			e.printStackTrace();		}
		
		return f;
	}
	
	public int getRating(int uid, String doc) {
		
		try {
			String sql = "select * from rating where doc_name = ? and user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, doc);
			ps.setInt(2, uid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(4);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	
	
	
}
