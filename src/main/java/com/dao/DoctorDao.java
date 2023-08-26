package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;
import com.entity.User;

public class DoctorDao {

	private Connection conn;
	
	public DoctorDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean registerDoctor(Doctor d) {
		boolean f = false;
		try {
			
			String sql = "insert into doctor_details(full_name,dob,qualification,specialist,email,phno,password) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialization());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getPhno());
			ps.setString(7, d.getPassword());
			
			
			int n = ps.executeUpdate();
			
			if(n == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Doctor> getAllDocs() {
		
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor d = null;
		
		try {
			
			String sql = "select * from doctor_details order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialization(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setPhno(rs.getString(7));
				d.setPassword(rs.getString(8));
				list.add(d);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public Doctor login(String email, String password) {
		Doctor d = null;
		
		try {
			
			String sql =  "select * from doctor_details where email = ? and password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2,password);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialization(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setPhno(rs.getString(7));
				d.setPassword(rs.getString(8));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return d;
	}
	
	public int countDocs() {
		int i = 0;
		try {
			String sql = "select * from doctor_details order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int getDoctorIdByName(String docName) {
		int id = 0;
		
		try {
			
			String sql = "select id from doctor_details where full_name = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, docName);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				id = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}
	

	
}











