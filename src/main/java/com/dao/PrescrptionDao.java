package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;
import com.entity.Prescription;

public class PrescrptionDao {

	private Connection conn;

	public PrescrptionDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addPrescrption(Prescription p) {
		
		boolean f = false;
		
		try {
			
			String sql = "insert into prescribe (prescribe,uid,apt_id) values (?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getPrescribe());
			ps.setInt(2, p.getuId());
			ps.setInt(3, p.getaId());
			System.out.println(p.getaId());
			
			int n = ps.executeUpdate();
			
			if(n == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	public List<Prescription> getAllPrsByUserId( int id ) {
		
		List<Prescription> list = new ArrayList<Prescription>();
		Prescription psc = null;
		
		try {
			
			String st = "Select * FROM prescribe where uid = ?";
			PreparedStatement ps = conn.prepareStatement(st);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				psc = new Prescription();
				psc.setpId(rs.getInt(1));
				psc.setPrescribe(rs.getString(2));
				psc.setuId(rs.getInt(3));
				psc.setaId(rs.getInt(4));
				list.add(psc);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
}
