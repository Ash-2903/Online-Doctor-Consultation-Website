package com.entity;

public class Doctor {

	private int id;
	private String fullName;
	private String dob;
	private String qualification;
	private String specialization;
	private String email;
	private String phno;
	private String password;
	
	
	public Doctor() {
		super();
	}


	public Doctor(String fullName, String dob, String qualification, String specialization, String email, String phno,
			String password) {
		super();
		this.fullName = fullName;
		this.dob = dob;
		this.qualification = qualification;
		this.specialization = specialization;
		this.email = email;
		this.phno = phno;
		this.password = password;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}


	public String getDob() {
		return dob;
	}


	public void setDob(String dob) {
		this.dob = dob;
	}


	public String getQualification() {
		return qualification;
	}


	public void setQualification(String qualification) {
		this.qualification = qualification;
	}


	public String getSpecialization() {
		return specialization;
	}


	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhno() {
		return phno;
	}


	public void setPhno(String phno) {
		this.phno = phno;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
	
}
