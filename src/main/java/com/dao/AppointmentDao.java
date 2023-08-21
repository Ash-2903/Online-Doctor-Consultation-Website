package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;
import com.entity.Doctor;

public class AppointmentDao {

	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addAppointment( Appointment ap ) {
		
		boolean f = false;
		
		try {
			
			String sql = "insert into appointment (user_id, full_name, gender, age , appoint_time, email, phno, diseases, specialist_id, address, status, doc_name, date) values (?,?,?,?,?,?,?,?,?,?,?,?,?) ";
			PreparedStatement ps = conn.prepareStatement(sql); 
			ps.setInt(1, ap.getUserId());
			ps.setString(2, ap.getFullName());
			ps.setString(3, ap.getGender());
			ps.setString(4, ap.getAge());
			ps.setString(5, ap.getAppoinTime());
			ps.setString(6, ap.getEmail());
			ps.setString(7, ap.getPhNo());
			ps.setString(8, ap.getDiseases());
			ps.setInt(9, ap.getSpId());
			ps.setString(10, ap.getAddress());
			ps.setString(11, ap.getStatus());
			ps.setString(12, ap.getDoctor());
			ps.setString(13, ap.getDate());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	public List<Appointment> getAllAppointmentsByLoginUser( int userId ) {
		
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		
		try {
			
			String sql = "select * from appointment where user_id= ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,userId);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinTime(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setSpId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				ap.setDoctor(rs.getString(13));
				ap.setDate(rs.getString(14));
				list.add(ap);
			}
			
		} catch (Exception e ) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public List<Appointment> getAllAppointmentsByLoginDoctor( Doctor d ) {
		
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		
		try {
			
			String st = "Select * FROM appointment where doc_name = ?";
			PreparedStatement ps = conn.prepareStatement(st);
			ps.setString(1, d.getFullName());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ap = new Appointment();
				/*
				 * ap.setId(rs.getInt(1)); ap.setUserId(rs.getInt(2));
				 */
				ap.setId(rs.getInt(1));
				/* ap.setId(rs.getInt(2)); */
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinTime(rs.getString(6));
				ap.setDate(rs.getString(14));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setSpId(rs.getInt(10));
				ap.setDiseases(rs.getString(9));
				ap.setStatus(rs.getString(12));
				/*
				 * ap.setSpId(rs.getInt(10)); ap.setAddress(rs.getString(11));
				 * ap.setDoctor(rs.getString(13));
				 */
				list.add(ap);
			}
			
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public Appointment getAppointmentById(int id) {
		
		Appointment ap = null;
		
		try {
			
			String sql = "select * from appointment where id = " + id;
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinTime(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setSpId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				ap.setDoctor(rs.getString(13));
				ap.setDate(rs.getString(14));
			}
			
			
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		
		return ap;
		
	}
	
	public Appointment getAppointmentByIdDb2(int id) {
		
		Appointment ap = null;
		
		try {
			
			String sql = "select * from old_appointment where id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinTime(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setSpId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				ap.setDoctor(rs.getString(13));
				ap.setDate(rs.getString(14));
			}
			
			
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		
		return ap;
		
	}
	
	
	public boolean updateCommentStatus( int id, String docName, String comment ) {
		
		boolean f = false;
		
		try {
			
			String sql = "update appointment set status = ? where id = ? and doc_name = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comment);
			ps.setInt(2, id);
			ps.setString(3, docName);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	public boolean updateDoctor(String docName, int appId) {
		
		boolean f = false;
		
		try {
			
			String sql = "update appointment set doc_name = ? where id = ?";
			/* System.out.println(docName); */
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, docName);
			ps.setInt(2, appId);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	public boolean deleteAppointment( int id ) {
		
		boolean f = false;
		
		try {
			
			String sql = "DELETE FROM appointment WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch( Exception e ) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	
	public int getUserIdForPrescription(int aptId) {
		int uid = 0;
		
		try {
			String sql = "select user_id from appointment where id = " + aptId;
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				uid = rs.getInt(1);
				/* System.out.println("fromthe server Uid : " + uid); */
			} else {
				System.out.println("getting uid didnt work in the servelt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return uid;
	}
	
	public boolean updateAptToOldAptDb( Appointment ap ) {
		
		boolean f1 = false;
		boolean f2 = false;
		boolean f3 = false;
		AppointmentDao dao = new AppointmentDao(conn);
		
		try {
			String sql = "insert into old_appointment (id,user_id, full_name, gender, age , appoint_time, email, phno, diseases, specialist_id, address, status, doc_name, date) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
			PreparedStatement ps = conn.prepareStatement(sql); 
			ps.setInt(1, ap.getId());
			ps.setInt(2, ap.getUserId());
			ps.setString(3, ap.getFullName());
			ps.setString(4, ap.getGender());
			ps.setString(5, ap.getAge());
			ps.setString(6, ap.getAppoinTime());
			ps.setString(7, ap.getEmail());
			ps.setString(8, ap.getPhNo());
			ps.setString(9, ap.getDiseases());
			ps.setInt(10, ap.getSpId());
			ps.setString(11, ap.getAddress());
			ps.setString(12, ap.getStatus());
			ps.setString(13, ap.getDoctor());
			ps.setString(14, ap.getDate());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f2 = true;
				System.out.println("insertion : " + f2);
			}
			
			f3 = dao.deleteAppointment(ap.getId());
			System.out.println("deleting : " + f3);
			if(f3 && f2) {
				f1 = true;
				System.out.println("total : " + f1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f1;
		
	}
	
public List<Appointment> getAllOldAppointmentsById( int id ) {
		
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		
		try {
			
			String st = "Select * FROM old_appointment where user_id = ?";
			PreparedStatement ps = conn.prepareStatement(st);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ap = new Appointment();
				/*
				 * ap.setId(rs.getInt(1)); ap.setUserId(rs.getInt(2));
				 */
				ap.setId(rs.getInt(1));
				/* ap.setId(rs.getInt(2)); */
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinTime(rs.getString(6));
				ap.setDate(rs.getString(14));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setSpId(rs.getInt(10));
				ap.setDiseases(rs.getString(9));
				ap.setStatus(rs.getString(12));
				ap.setDoctor(rs.getString(13));
				list.add(ap);
			}
			
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
}
















